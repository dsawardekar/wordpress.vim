require 'spec_helper'
require 'dynamo/project'
require 'dynamo/file'
require 'dynamo/function'
require 'dynamo/param'
require 'dynamo/argument'
require 'dynamo/return'
require 'nokogiri'

module Dynamo
  shared_examples 'a Project' do
    it 'parses project title' do
      expect(project.title).to eq(project_title)
    end

    it 'parses project version' do
      expect(project.version).to eq(project_version)
    end

    it 'parses project files' do
      project.files.each_with_index do |file, index|
        expect(file).to equal(project_files[index])
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

    let(:project) do
      project = Project.new
      project.parse(node)
      project
    end

    context 'without files' do
      let(:node_text) do
        '<project title="API Documentation" version="2.3">
        </project>'
      end

      let(:project_title) { 'API Documentation' }
      let(:project_version) { '2.3' }
      let(:project_files) { [] }

      it_behaves_like 'a Project'
    end

    context 'with file with functions' do
      let(:node_text) do
        text = <<-eos
        <project title="API Documentation" version="2.3">
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

        text
      end

      let(:project_title) { 'API Documentation' }
      let(:project_version) { '2.3' }
      let(:project_files) do
        files = []

        file = File.new
        file.path = 'post.php'
        file.package = 'foo'

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
        file.functions = functions
        file.classes = []

        files << file
        files
      end

      it_behaves_like 'a Project'
    end
  end
end
