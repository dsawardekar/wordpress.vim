require 'spec_helper'
require 'dynamo/property'
require 'nokogiri'

module Dynamo
  shared_examples 'a Property' do
    it 'parses property static' do
      expect(property.static).to eq(property_static)
    end

    it 'parses property visibility' do
      expect(property.visibility).to eq(property_visibility)
    end

    it 'parses property name' do
      expect(property.name).to eq(property_name)
    end

    it 'parses property full_name' do
      expect(property.full_name).to eq(property_full_name)
    end

    it 'parses property default' do
      expect(property.default).to eq(property_default)
    end

    it 'parses property type' do
      expect(property.type).to eq(property_type)
    end
  end

  describe Property do
    let(:node) do
      xml = Nokogiri::XML.parse(node_text) do |config|
        config.noblanks
      end

      xml.root
    end

    let(:property) do
      property = Property.new
      property.parse(node)
      property
    end

    context 'with public property' do
      let(:node_text) do
        text = <<-eos
          <property static="false" visibility="public" namespace="" line="14" package="WordPress\\Customize">
            <name>$capability</name>
            <full_name>\\WP_Customize_Setting::capability</full_name>
            <default>'edit_theme_options'</default>
            <docblock line="14">
              <description></description>
              <long-description></long-description>
            </docblock>
          </property>
eos
        text
      end

      let(:property_name) { '$capability' }
      let(:property_full_name) { '\\WP_Customize_Setting::capability' }
      let(:property_visibility) { 'public' }
      let(:property_static) { false }
      let(:property_type) { nil }
      let(:property_default) { "'edit_theme_options'" }

      it_behaves_like 'a Property'
    end

    context 'with static property' do
      let(:node_text) do
        text = <<-eos
          <property static="true" visibility="public" namespace="" line="14" package="WordPress\\Customize">
            <name>$capability</name>
            <full_name>\\WP_Customize_Setting::capability</full_name>
            <default>'edit_theme_options'</default>
            <docblock line="14">
              <description></description>
              <long-description></long-description>
              <tag name="var" line="59" description="" type="float" variable="">
                <type>float</type>
              </tag>
            </docblock>
          </property>
eos
        text
      end

      let(:property_name) { '$capability' }
      let(:property_full_name) { '\\WP_Customize_Setting::capability' }
      let(:property_visibility) { 'public' }
      let(:property_static) { true }
      let(:property_type) { 'float' }
      let(:property_default) { "'edit_theme_options'" }

      it_behaves_like 'a Property'
    end

    context 'viml dict' do
      it 'can convert property without default' do
        property = Property.new
        property.name = 'message'
        property.type = 'string'
        property.default = ''

        output = property.to_dict
        expect(output).to eq("'message': {'initializer': '', 'type': 'string'}")
      end

      it 'can convert property with default' do
        property = Property.new
        property.name = 'message'
        property.type = 'string'
        property.default = '42'

        output = property.to_dict
        expect(output).to eq("'message': {'initializer': '42', 'type': 'string'}")
      end
    end
  end
end
