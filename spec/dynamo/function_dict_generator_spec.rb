require 'spec_helper'
require 'dynamo/function'
require 'dynamo/function_dict_generator'
require 'dynamo/file'
require 'dynamo/project_scanner'
require 'nokogiri'

module Dynamo
  describe FunctionDictGenerator do
    let(:generator) { FunctionDictGenerator.new }

    it 'can store functions' do
      func1 = double()
      func2 = double()
      file = double()

      generator.update('function', [func1, file])
      generator.update('function', [func2, file])
    end

    it 'can convert filename to viml key' do
      expect(generator.filename_to_key('post.php')).to eq('wp_post')
    end

    it 'can convert pathname to viml key' do
      expect(generator.filename_to_key('foo/bar/post.php')).to eq('wp_post')
    end

    it 'can build viml variable for file' do
      expect(generator.viml_variable('wp_post')).to eq(
        "g:phpcomplete_builtin['functions']['wp_post']"
      )
    end

    it 'can build dict from file with functions' do
      node_text = <<-eos
      <project title='foo'>
        <file path="post.php" generated-path="post.html" hash="ce9edb6b7b49b028dd320ca7f72049f6" package="foo">
          <function namespace="" line="355" package="foo">
            <name>get_extended</name>
            <full_name>get_extended()</full_name>
            <docblock line="355">
              <description>Get extended entry info (&lt;!--more--&gt;).</description>
              <long-description>There should not be any space after the second dash and before the word
      'more'. There can be text or space(s) after the word 'more', but won't be
      referenced.

      The returned array has 'main', 'extended', and 'more_text' keys. Main has the text before
      the &lt;code&gt;&lt;!--more--&gt;&lt;/code&gt;. The 'extended' key has the content after the
      &lt;code&gt;&lt;!--more--&gt;&lt;/code&gt; comment. The 'more_text' key has the custom "Read More" text.</long-description>
              <tag name="since" line="355" description="1.0.0"/>
              <tag name="param" line="355" description="Post content" type="string" variable="$post">
                <type>string</type>
              </tag>
              <tag name="return" line="355" description="An Array" type="array">
                <type>array</type>
              </tag>
            </docblock>
            <argument line="0" by_reference="false">
              <name>$post</name>
              <default></default>
              <type>string</type>
            </argument>
          </function>
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

      expect(generator.build).to eq(expected)
      expect(generator.modules).to eq(['wp_post'])
    end

    it 'can build list of modules' do
      generator.modules = ['lorem', 'ipsum', 'dolor']
      output = generator.build_module_list

      expected = "let g:wordpress_active_function_extensions = [
\\ 'lorem',
\\ 'ipsum',
\\ 'dolor',
\\]"

      expect(output).to eq(expected)
    end
  end
end
