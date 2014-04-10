require 'spec_helper'
require 'dynamo/class'
require 'dynamo/argument'
require 'dynamo/param'
require 'dynamo/return'
require 'dynamo/method'
require 'dynamo/property'
require 'nokogiri'

module Dynamo

  shared_examples 'a Class' do
    it 'parses class namespace' do
      expect(klass.namespace).to eq(klass_namespace)
    end

    it 'parses class package' do
      expect(klass.package).to eq(klass_package)
    end

    it 'parses class name' do
      expect(klass.name).to eq(klass_name)
    end

    it 'parses class full_name' do
      expect(klass.full_name).to eq(klass_full_name)
    end

    it 'parses class extends' do
      expect(klass.extends).to eq(klass_extends)
    end

    it 'parses class abstract' do
      expect(klass.abstract).to eq(klass_abstract)
    end

    it 'parses class properties' do
      klass.properties.each_with_index do |property, index|
        expect(property).to equal(klass_properties[index])
      end
    end

    it 'parses class methods' do
      klass.methods.each_with_index do |method, index|
        expect(method).to equal(klass_methods[index])
      end
    end
  end

  describe Class do
    let(:node) do
      xml = Nokogiri::XML.parse(node_text) do |config|
        config.noblanks
      end

      xml.root
    end

    let(:klass) do
      klass = Class.new
      klass.parse(node)
      klass
    end

    context 'without class contents' do
      let(:node_text) do
        text = <<-eos
        <class final="false" abstract="false" namespace="" line="9" package="WordPress\\Customize">
          <name>WP_Customize_Setting</name>
          <full_name>\\WP_Customize_Setting</full_name>
          <extends>Foo</extends>
          end
        </class>
        eos

        text
      end

      let(:klass_name) { 'WP_Customize_Setting' }
      let(:klass_full_name) { '\\WP_Customize_Setting' }
      let(:klass_namespace) { '' }
      let(:klass_package) { 'WordPress\\Customize' }
      let(:klass_extends) { 'Foo' }
      let(:klass_abstract) { false }
      let(:klass_properties) { [] }
      let(:klass_methods) { [] }

      it_behaves_like 'a Class'
    end

    context 'with class with methods and properties' do
      let(:node_text) do
        text = <<-eos
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
        eos

        text
      end

      let(:klass_name) { 'WP_Customize_Setting' }
      let(:klass_full_name) { '\\WP_Customize_Setting' }
      let(:klass_namespace) { '' }
      let(:klass_package) { 'WordPress\\Customize' }
      let(:klass_extends) { '' }
      let(:klass_abstract) { false }
      let(:klass_properties) do
        properties = []

        property = Property.new
        property.static = false
        property.visibility = 'public'
        property.name = '$manager'
        property.full_name = '\\WP_Customize_Setting::manager'
        property.default = ''
        properties << property

        property = Property.new
        property.static = false
        property.visibility = 'public'
        property.name = '$id'
        property.full_name = '\\WP_Customize_Setting::id'
        property.default = ''
        properties << property

        properties
      end

      let(:klass_methods) do
        methods = []
        method = Method.new
        method.namespace = ''
        method.package = 'WordPress\\Customize'
        method.static = false
        method.visibility = 'public'
        method.abstract = false
        method.name = 'preview'
        method.full_name = '\\WP_Customize_Setting::preview()'
        method.returns = nil
        method.arguments = []
        method.params = []
        methods << method

        method = Method.new
        method.static = false
        method.visibility = 'public'
        method.namespace = ''
        method.package = 'WordPress\\Customize'
        method.abstract = false
        method.name = '_preview_filter'
        method.full_name = '\\WP_Customize_Setting::_preview_filter()'
        method.arguments = []
        method.params = []
        method.returns = nil

        param = Param.new
        param.type = 'mixed'
        param.description = 'the param'
        param.variable = '$original'
        param.types = ['mixed']
        method.params = [param]

        arguments = []
        argument = Argument.new
        argument.by_reference = false
        argument.name = '$original'
        argument.default = ''
        argument.type = 'mixed'
        arguments << argument
        method.arguments = arguments

        returns = Return.new
        returns.description = 'New or old value.'
        returns.type = 'mixed'
        returns.types = ['mixed']
        method.returns = returns

        methods << method
        methods
      end

      it_behaves_like 'a Class'
    end

    context 'viml dict' do
      it 'can convert class without body' do
        klass = Class.new
        klass.name = 'Lorem'

        expected = "\\'lorem': {\n\\  'name': 'Lorem',\n\\},\n"
        output = klass.to_dict
        expect(output).to eq(expected)
      end

      it 'can convert class with properties' do
        klass = Class.new
        klass.name = 'LengthException'

        properties = []
        prop = Property.new
        prop.name = 'message'
        prop.type = 'string'
        prop.default = ''
        prop.visibility = 'public'
        properties << prop

        prop = Property.new
        prop.name = 'line'
        prop.type = 'string'
        prop.default = ''
        prop.visibility = 'public'
        properties << prop

        klass.properties = properties

        expected = "\\'lengthexception': {
\\  'name': 'LengthException',
\\  'properties': {
\\    'message': {'initializer': '', 'type': 'string'},
\\    'line': {'initializer': '', 'type': 'string'},
\\  },
\\},\n"

        output = klass.to_dict
        expect(output).to eq(expected)
      end

      it 'can convert class with static properties' do
        klass = Class.new
        klass.name = 'LengthException'

        properties = []
        prop = Property.new
        prop.name = 'message'
        prop.type = 'string'
        prop.default = ''
        prop.visibility = 'public'
        prop.static = true
        properties << prop

        prop = Property.new
        prop.name = 'line'
        prop.type = 'string'
        prop.default = ''
        prop.visibility = 'public'
        prop.static = true
        properties << prop

        klass.properties = properties

        expected = "\\'lengthexception': {
\\  'name': 'LengthException',
\\  'static_properties': {
\\    'message': {'initializer': '', 'type': 'string'},
\\    'line': {'initializer': '', 'type': 'string'},
\\  },
\\},\n"

        output = klass.to_dict
        expect(output).to eq(expected)
      end

      it 'can convert class with methods' do
        klass = Class.new
        klass.name = 'LengthException'

        methods = []
        method = Method.new
        method.name = 'getMessage'
        method.visibility = 'public'
        method.returns = nil
        method.arguments = []
        methods << method

        method = Method.new
        method.name = 'getCode'
        method.visibility = 'public'
        method.returns = nil
        method.arguments = []
        methods << method

        klass.methods = methods

        expected = "\\'lengthexception': {
\\  'name': 'LengthException',
\\  'methods': {
\\    'getMessage': { 'signature': 'void', 'return_type': 'void'},
\\    'getCode': { 'signature': 'void', 'return_type': 'void'},
\\  },
\\},\n"

        output = klass.to_dict
        expect(output).to eq(expected)
      end

      it 'can convert class with static methods' do
        klass = Class.new
        klass.name = 'LengthException'

        methods = []
        method = Method.new
        method.name = 'getMessage'
        method.visibility = 'public'
        method.returns = nil
        method.static = true
        method.arguments = []
        methods << method

        method = Method.new
        method.name = 'getCode'
        method.visibility = 'public'
        method.returns = nil
        method.static = true
        method.arguments = []
        methods << method

        klass.methods = methods

        expected = "\\'lengthexception': {
\\  'name': 'LengthException',
\\  'static_methods': {
\\    'getMessage': { 'signature': 'void', 'return_type': 'void'},
\\    'getCode': { 'signature': 'void', 'return_type': 'void'},
\\  },
\\},\n"

        output = klass.to_dict
        expect(output).to eq(expected)
      end

    end
  end
end
