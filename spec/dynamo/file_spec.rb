require 'spec_helper'
require 'dynamo/file'
require 'dynamo/function'
require 'dynamo/param'
require 'dynamo/argument'
require 'dynamo/return'
require 'dynamo/class'
require 'nokogiri'

module Dynamo
  shared_examples 'a File' do
    it 'parses file path' do
      expect(file.path).to eq(file_path)
    end

    it 'parses file package' do
      expect(file.package).to eq(file_package)
    end

    it 'parses file functions' do
      file.functions.each_with_index do |function, index|
        expect(function).to equal(file_functions[index])
      end
    end

    it 'parses file classes' do
      file.classes.each_with_index do |klass, index|
        expect(klass).to equal(file_classes[index])
      end
    end
  end

  describe File do
    let(:node) do
      xml = Nokogiri::XML.parse(node_text) do |config|
        config.noblanks
      end

      xml.root
    end

    let(:file) do
      file = File.new
      file.parse(node)
      file
    end

    context 'with file without functions' do
      let(:node_text) do
        '<file path="post.php" generated-path="post.html" hash="ce9edb6b7b49b028dd320ca7f72049f6" package="foo">
        </file>'
      end

      let(:file_path) { 'post.php' }
      let(:file_package) { 'foo' }
      let(:file_functions) { [] }
      let(:file_classes) { [] }

      it_behaves_like 'a File'
    end

    context 'with file with functions' do
      let(:node_text) do
        text = <<-eos
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
  eos

        text
      end

      let(:file_path) { 'post.php' }
      let(:file_package) { 'foo' }
      let(:file_classes) { [] }
      let(:file_functions) do
        functions = []
        function = Function.new
        function.name = 'get_extended'
        function.full_name = 'get_extended()'
        function.namespace = ''
        function.package = 'foo'
        function.arguments = []

        argument = Argument.new
        argument.name = '$post'
        argument.default = nil
        argument.by_reference = false
        argument.type = 'string'

        function.arguments << argument

        params = []
        param = Param.new
        param.type = 'string'
        param.description = 'Post content'
        param.variable = '$post'
        param.types = ['string']

        params << param
        function.params = params

        returns = Return.new
        returns.type = 'array'
        returns.description = 'An Array'
        returns.types = ['array']
        function.returns = returns

        functions << function
        functions
      end

      it_behaves_like 'a File'
    end

    context 'with file with classes' do
      let(:node_text) do
        text = <<-eos
        <file path="post.php" generated-path="post.html" hash="ce9edb6b7b49b028dd320ca7f72049f6" package="">
          <class final="true" abstract="false" namespace="" line="426" package="">
            <extends/>
            <name>WP_Post</name>
            <full_name>\\WP_Post</full_name>
          </class>
          <class final="false" abstract="false" namespace="" line="9" package="WordPress\\Customize">
            <extends/>
            <name>WP_Customize_Setting</name>
            <full_name>\\WP_Customize_Setting</full_name>
          </class>
        </file>
        eos
        text
      end

      let(:file_path) { 'post.php' }
      let(:file_package) { '' }
      let(:file_classes) do
        classes = []
        klass = Class.new
        klass.name = 'WP_Post'
        klass.full_name = '\\WP_Post'
        klass.extends = ''
        klass.abstract = false
        klass.package = ''
        klass.namespace = ''
        klass.methods = []
        klass.properties = []
        classes << klass

        klass = Class.new
        klass.name = 'WP_Customize_Setting'
        klass.full_name = '\\WP_Customize_Setting'
        klass.extends = ''
        klass.abstract = false
        klass.package = 'WordPress\\Customize'
        klass.namespace = ''
        klass.methods = []
        klass.properties = []
        classes << klass

        classes
      end

      let(:file_functions) do
        functions = []
        function = Function.new
        function.name = 'get_extended'
        function.full_name = 'get_extended()'
        function.namespace = ''
        function.package = 'foo'
        function.arguments = []

        argument = Argument.new
        argument.name = '$post'
        argument.default = nil
        argument.by_reference = false
        argument.type = 'string'

        function.arguments << argument

        params = []
        param = Param.new
        param.type = 'string'
        param.description = 'Post content'
        param.variable = '$post'
        param.types = ['string']

        params << param
        function.params = params

        returns = Return.new
        returns.type = 'array'
        returns.description = 'An Array'
        returns.types = ['array']
        function.returns = returns

        functions << function
        functions
      end

      it_behaves_like 'a File'
    end
  end
end
