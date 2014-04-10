require 'spec_helper'
require 'dynamo/function'
require 'dynamo/function_dict_generator'
require 'dynamo/file'
require 'dynamo/project_scanner'
require 'dynamo/class_dict_generator'
require 'nokogiri'

module Dynamo
  describe ClassDictGenerator do
    let(:generator) { ClassDictGenerator.new }

    it 'can store classes' do
      klass1 = double()
      klass2 = double()
      file = double()

      generator.update('class', [klass1, file])
      generator.update('class', [klass2, file])

      expect(generator.classes.length).to eq(2)
    end

    it 'can convert filename to viml key' do
      expect(generator.filename_to_key('post.php')).to eq('wp_post')
    end

    it 'can convert pathname to viml key' do
      expect(generator.filename_to_key('foo/bar/post.php')).to eq('wp_post')
    end

    it 'can build viml variable for file' do
      expect(generator.viml_variable('wp_post')).to eq(
        "g:phpcomplete_builtin['classes']['wp_post']"
      )
    end

    it 'can build list of modules' do
      generator.modules = ['lorem', 'ipsum', 'dolor']
      output = generator.build_module_list

      expected = "let g:wordpress_active_class_extensions = [
\\ 'lorem',
\\ 'ipsum',
\\ 'dolor',
\\]"

      expect(output).to eq(expected)
    end

    it 'can build dict from file with classes' do
      node_text = <<-eos
      <project title='foo'>
        <file path="post.php" generated-path="post.html" hash="ce9edb6b7b49b028dd320ca7f72049f6" package="foo">
        <class final="false" abstract="false" namespace="" line="9" package="WordPress\\Customize">
          <extends/>
          <name>WP_Customize_Setting</name>
          <full_name>\\WP_Customize_Setting</full_name>
          <docblock line="9">
            <description>Customize Setting Class.</description>
            <long-description></long-description>
            <tag name="package" line="9" description="WordPress"/>
            <tag name="subpackage" line="9" description="Customize"/>
            <tag name="since" line="9" description="3.4.0"/>
          </docblock>
          <property static="false" visibility="public" namespace="" line="10" package="WordPress\\Customize">
            <name>$manager</name>
            <full_name>\\WP_Customize_Setting::manager</full_name>
            <default></default>
            <docblock line="10">
              <description></description>
              <long-description></long-description>
            </docblock>
          </property>
          <property static="false" visibility="public" namespace="" line="11" package="WordPress\\Customize">
            <name>$id</name>
            <full_name>\\WP_Customize_Setting::id</full_name>
            <default></default>
            <docblock line="11">
              <description></description>
              <long-description></long-description>
            </docblock>
          </property>
          <method final="false" abstract="false" static="false" visibility="public" namespace="" line="69" package="WordPress\\Customize">
            <name>preview</name>
            <full_name>\\WP_Customize_Setting::preview()</full_name>
            <docblock line="69">
              <description>Handle previewing the setting.</description>
              <long-description></long-description>
              <tag name="since" line="69" description="3.4.0"/>
            </docblock>
          </method>
          <method final="false" abstract="false" static="false" visibility="public" namespace="" line="96" package="WordPress\\Customize">
            <name>_preview_filter</name>
            <full_name>\\WP_Customize_Setting::_preview_filter()</full_name>
            <docblock line="96">
              <description>Callback function to filter the theme mods and options.</description>
              <long-description></long-description>
              <tag name="since" line="96" description="3.4.0"/>
              <tag name="uses" line="96" description="" link="WP_Customize_Setting::multidimensional_replace()"/>
              <tag name="param" line="96" description="the param" type="mixed" variable="$original">
                <type>mixed</type>
              </tag>
              <tag name="return" line="96" description="New or old value." type="mixed">
                <type>mixed</type>
              </tag>
            </docblock>
            <argument line="0" by_reference="false">
              <name>$original</name>
              <default></default>
              <type>mixed</type>
            </argument>
          </method>
        </class>
        </file>
      </project>
      eos

      xml = Nokogiri::XML.parse(node_text) do |config|
        config.noblanks
      end

      node = xml.root

      project = Project.new
      project.parse(node)

      scanner = ProjectScanner.new
      scanner.add_observer(generator)
      scanner.scan(project)

      expected = "let g:phpcomplete_builtin['functions']['wp_post'] = {
\\ 'get_extended(': 'string $post | array',
\\}"

      expected = "let g:phpcomplete_builtin['classes']['wp_post'] = {
\\'wp_customize_setting': {
\\  'name': 'WP_Customize_Setting',
\\  'properties': {
\\    '$manager': {'initializer': '', 'type': ''},
\\    '$id': {'initializer': '', 'type': ''},
\\  },
\\  'methods': {
\\    'preview': { 'signature': 'void', 'return_type': 'void'},
\\    '_preview_filter': { 'signature': 'mixed $original', 'return_type': 'mixed'},
\\  },
\\},
\\}\n"

      output = generator.build

      expect(output).to eq(expected)
      expect(generator.modules).to eq(['wp_post'])
    end
  end
end
