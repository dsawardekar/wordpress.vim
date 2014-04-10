require 'spec_helper'
require 'dynamo/function'
require 'dynamo/argument'
require 'dynamo/param'
require 'dynamo/return'
require 'nokogiri'

module Dynamo

  shared_examples 'a Function' do
    it 'parses function namespace' do
      expect(function.name).to eq(function_name)
    end

    it 'parses function package' do
      expect(function.package).to eq(function_package)
    end

    it 'parses function name' do
      expect(function.name).to eq(function_name)
    end

    it 'parses function full_name' do
      expect(function.full_name).to eq(function_full_name)
    end

    it 'parses function deprecated' do
      expect(function.deprecated).to eq(function_deprecated)
    end

    it 'parses function arguments' do
      function.arguments.each_with_index do |argument, index|
        arg = function_arguments[index]
        expect(argument).to equal(arg)
      end
    end

    it 'parses function params' do
      function.params.each_with_index do |param, index|
        expect(param).to equal(function_params[index])
      end
    end

    it 'parses function return' do
      expect(function.returns).to equal(function_returns)
    end
  end

  describe Function do
    let(:node) do
      xml = Nokogiri::XML.parse(node_text) do |config|
        config.noblanks
      end

      xml.root
    end

    let(:function) do
      function = Function.new
      function.parse(node)
      function
    end

    context 'with single return' do
      let(:node_text) do
        text = <<-eos
    <function namespace="" line="355" package="">
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
eos

        text
      end

      let(:function_name) { 'get_extended' }
      let(:function_full_name) { 'get_extended()' }
      let(:function_deprecated) { false }
      let(:function_namespace) { '' }
      let(:function_package) { '' }
      let(:function_arguments) do

        arguments = []
        argument = Argument.new
        argument.name = '$post'
        argument.default = nil
        argument.by_reference = false
        argument.type = 'string'

        arguments << argument
        arguments
      end

      let(:function_params) do
        params = []
        param = Param.new
        param.type = 'string'
        param.description = 'Post content'
        param.variable = '$post'
        param.types = ['string']

        params << param
        params
      end

      let(:function_returns) do
        returns = Return.new
        returns.type = 'array'
        returns.description = 'An Array'
        returns.types = ['array']

        returns
      end

      it_behaves_like 'a Function'
    end

    context 'with multiple returns' do
      let(:node_text) do
        text = <<-eos
    <function namespace="" line="355" package="">
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
          <type>string</type>
        </tag>
      </docblock>
      <argument line="0" by_reference="false">
        <name>$post</name>
        <default></default>
        <type>string</type>
      </argument>
    </function>
eos

        text
      end

      let(:function_name) { 'get_extended' }
      let(:function_full_name) { 'get_extended()' }
      let(:function_deprecated) { false }
      let(:function_namespace) { '' }
      let(:function_package) { '' }
      let(:function_arguments) do
        arguments = []
        argument = Argument.new
        argument.name = '$post'
        argument.default = nil
        argument.by_reference = false
        argument.type = 'string'

        arguments << argument
        arguments
      end

      let(:function_params) do
        params = []
        param = Param.new
        param.type = 'string'
        param.description = 'Post content'
        param.variable = '$post'
        param.types = ['string']

        params << param
        params
      end

      let(:function_returns) do
        returns = Return.new
        returns.type = 'array'
        returns.description = 'An Array'
        returns.types = ['array', 'string']

        returns
      end

      it_behaves_like 'a Function'
    end

    context 'with multiple params' do
      let(:node_text) do
        text = <<-eos
    <function namespace="" line="355" package="">
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
        <tag name="param" line="355" description="Post type" type="string" variable="$post_type">
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
eos

        text
      end

      let(:function_name) { 'get_extended' }
      let(:function_full_name) { 'get_extended()' }
      let(:function_deprecated) { false }
      let(:function_namespace) { '' }
      let(:function_package) { '' }
      let(:function_arguments) do

        arguments = []
        argument = Argument.new
        argument.name = '$post'
        argument.default = nil
        argument.by_reference = false
        argument.type = 'string'

        arguments << argument
        arguments
      end

      let(:function_params) do
        params = []
        param = Param.new
        param.type = 'string'
        param.description = 'Post content'
        param.variable = '$post'
        param.types = ['string']
        params << param

        param = Param.new
        param.type = 'string'
        param.description = 'Post type'
        param.variable = '$post_type'
        param.types = ['string']
        params << param

        params
      end

      let(:function_returns) do
        returns = Return.new
        returns.type = 'array'
        returns.description = 'An Array'
        returns.types = ['array']

        returns
      end

      it_behaves_like 'a Function'
    end

    context 'with deprecated tag' do
      let(:node_text) do
        text = <<-eos
    <function namespace="" line="355" package="">
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
        <tag name="deprecated" line="33" description="3.0.0"/>
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
eos

        text
      end

      let(:function_name) { 'get_extended' }
      let(:function_full_name) { 'get_extended()' }
      let(:function_deprecated) { true }
      let(:function_namespace) { '' }
      let(:function_package) { '' }
      let(:function_arguments) do
        arguments = []
        argument = Argument.new
        argument.name = '$post'
        argument.default = nil
        argument.by_reference = false
        argument.type = 'string'

        arguments << argument
        arguments
      end

      let(:function_params) do
        params = []
        param = Param.new
        param.type = 'string'
        param.description = 'Post content'
        param.variable = '$post'
        param.types = ['string']

        params << param
        params
      end

      let(:function_returns) do
        returns = Return.new
        returns.type = 'array'
        returns.description = 'An Array'
        returns.types = ['array']

        returns
      end

      it_behaves_like 'a Function'
    end

    context 'viml dict' do
      it 'can convert function with single arg' do
        function          = Function.new
        function.name     = 'abs'

        args = []
        arg = Argument.new
        arg.type = 'mixed'
        arg.name = '$number'
        args << arg
        function.arguments = args

        returns = Return.new
        returns.type = 'number'
        function.returns = returns

        expect(function.to_dict).to eq(
          "'abs(': 'mixed $number | number'"
        )
      end

      it 'can convert function with multiple args' do
        function          = Function.new
        function.name     = 'base_convert'

        args = []
        arg = Argument.new
        arg.type = 'string'
        arg.name = '$number'
        args << arg

        arg = Argument.new
        arg.type = 'int'
        arg.name = '$frombase'
        args << arg

        arg = Argument.new
        arg.type = 'int'
        arg.name = '$tobase'
        args << arg

        function.arguments = args

        returns = Return.new
        returns.type = 'string'
        function.returns = returns

        expect(function.to_dict).to eq(
          "'base_convert(': 'string $number, int $frombase, int $tobase | string'"
        )
      end

      it 'can convert function without return' do
        function          = Function.new
        function.name     = 'absvoid'

        args = []
        arg = Argument.new
        arg.type = 'mixed'
        arg.name = '$number'
        args << arg
        function.arguments = args

        expect(function.to_dict).to eq(
          "'absvoid(': 'mixed $number | void'"
        )
      end

      it 'can convert function without arguments' do
        function          = Function.new
        function.name     = 'absempty'
        function.arguments = []

        expect(function.to_dict).to eq("'absempty(': 'void | void'")
      end

      # TODO: optional arguments
    end


  end

end
