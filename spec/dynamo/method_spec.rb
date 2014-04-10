require 'spec_helper'
require 'dynamo/method'
require 'dynamo/argument'
require 'dynamo/param'
require 'dynamo/return'
require 'nokogiri'

module Dynamo
  shared_examples 'a Method' do
    it 'parses method static' do
      expect(method.static).to eq(method_static)
    end

    it 'parses method visibility' do
      expect(method.visibility).to eq(method_visibility)
    end

    it 'parses method abstract' do
      expect(method.abstract).to eq(method_abstract)
    end
  end

  describe Method do
    let(:node) do
      xml = Nokogiri::XML.parse(node_text) do |config|
        config.noblanks
      end

      xml.root
    end

    let(:method) do
      method = Method.new
      method.parse(node)
      method
    end

    context 'with public method without returns' do
      let(:node_text) do
        text = <<-eos
        <method final="false" abstract="false" static="false" visibility="public" namespace="" line="69" package="WordPress\\Customize">
          <name>preview</name>
          <full_name>\\WP_Customize_Setting::preview()</full_name>
          <docblock line="69">
            <description>Handle previewing the setting.</description>
            <long-description></long-description>
            <tag name="since" line="69" description="3.4.0"/>
          </docblock>
        </method>
        eos

        text
      end

      let(:method_static) { false }
      let(:method_visibility) { 'public' }
      let(:method_abstract) { false }
      let(:function) { method }
      let(:function_name) { 'preview' }
      let(:function_full_name) { '\\WP_Customize_Setting::preview()' }
      let(:function_deprecated) { false }
      let(:function_namespace) { '' }
      let(:function_package) { 'WordPress\\Customize' }
      let(:function_returns) { nil }

      it_behaves_like 'a Method'
      it_behaves_like 'a Function'
    end

    context 'with public method with params & returns' do
      let(:node_text) do
        text = <<-eos
        <method final="false" abstract="false" static="false" visibility="protected" namespace="" line="159" package="WordPress\\Customize">
          <name>update</name>
          <full_name>\\WP_Customize_Setting::update()</full_name>
          <docblock line="159">
            <description>Set the value of the parameter for a specific theme.</description>
            <long-description></long-description>
            <tag name="since" line="159" description="3.4.0"/>
            <tag name="param" line="159" description="the value" type="mixed" variable="$value">
              <type>mixed</type>
            </tag>
            <tag name="return" line="159" description="the result" type="mixed">
              <type>mixed</type>
            </tag>
          </docblock>
          <argument line="0" by_reference="false">
            <name>$value</name>
            <default></default>
            <type>mixed</type>
          </argument>
        </method>
        eos

        text
      end

      let(:method_static) { false }
      let(:method_visibility) { 'protected' }
      let(:method_abstract) { false }
      let(:function) { method }
      let(:function_name) { 'update' }
      let(:function_full_name) { '\\WP_Customize_Setting::update()' }
      let(:function_deprecated) { false }
      let(:function_namespace) { '' }
      let(:function_package) { 'WordPress\\Customize' }
      let(:function_params) do
        params = []
        param = Param.new
        param.type = 'mixed'
        param.description = 'the value'
        param.variable = '$value'
        param.types = ['mixed']

        params << param
        params
      end

      let(:function_arguments) do
        arguments = []
        argument = Argument.new
        argument.name = '$value'
        argument.default = ''
        argument.by_reference = false
        argument.type = 'mixed'

        arguments << argument
        arguments
      end

      let(:function_returns) do
        returns = Return.new
        returns.type = 'mixed'
        returns.description = 'the result'
        returns.types = ['mixed']

        returns
      end

      it_behaves_like 'a Method'
      it_behaves_like 'a Function'
    end

    context 'viml dict' do
      it 'can convert method with single arg' do
        method = Method.new
        method.name = 'append'

        args = []
        arg = Argument.new
        arg.type = 'mixed'
        arg.name = '$value'
        args << arg
        method.arguments = args

        returns = Return.new
        returns.type = 'bool'
        method.returns = returns

        expect(method.to_dict).to eq(
          "'append': { 'signature': 'mixed $value', 'return_type': 'bool'}"
        )
      end

      it 'can convert method without args' do
        method = Method.new
        method.name = 'append'

        method.arguments = []

        returns = Return.new
        returns.type = 'bool'
        method.returns = returns

        expect(method.to_dict).to eq(
          "'append': { 'signature': 'void', 'return_type': 'bool'}"
        )
      end

      it 'can convert method with multiple args' do
        method = Method.new
        method.name = 'append'

        args = []

        arg = Argument.new
        arg.type = 'mixed'
        arg.name = '$value'
        args << arg

        arg = Argument.new
        arg.type = 'string'
        arg.name = '$foo'
        args << arg

        method.arguments = args

        returns = Return.new
        returns.type = 'bool'
        method.returns = returns

        expect(method.to_dict).to eq(
          "'append': { 'signature': 'mixed $value, string $foo', 'return_type': 'bool'}"
        )
      end
    end
  end
end
