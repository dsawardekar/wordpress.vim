require 'spec_helper'
require 'dynamo/param'
require 'nokogiri'

module Dynamo
  shared_examples 'a param' do
    it 'parses param type' do
      expect(param.type).to eq(param_type)
    end

    it 'parses param variable' do
      expect(param.variable).to eq(param_variable)
    end

    it 'parses param description' do
      expect(param.description).to eq(param_description)
    end

    it 'parses param types' do
      expect(param.types).to eq(param_types)
    end
  end

  describe Param do
    let(:node) do
      xml = Nokogiri::XML.parse(node_text) do |config|
        config.noblanks
      end

      xml.root
    end

    let(:param) do
      param = Param.new
      param.parse(node)
      param
    end

    context 'with empty types' do
      let(:node_text) do
        '<tag name="param" line="185" description="Attachment ID" type="int" variable="$attachment_id">
        </tag>'
      end

      let(:param_type) { 'int' }
      let(:param_variable) { '$attachment_id' }
      let(:param_description) { 'Attachment ID' }
      let(:param_types) { [] }

      it_behaves_like 'a param'
    end

    context 'with single type' do
      let(:node_text) do
        '<tag name="param" line="185" description="Attachment ID" type="int" variable="$attachment_id">
          <type>int</type>
        </tag>'
      end

      let(:param_type) { 'int' }
      let(:param_variable) { '$attachment_id' }
      let(:param_description) { 'Attachment ID' }
      let(:param_types) { ['int'] }

      it_behaves_like 'a param'
    end

    context 'with multiple types' do
      let(:node_text) do
        '<tag name="param" line="185" description="Attachment ID" type="int" variable="$attachment_id">
          <type>int</type>
          <type>string</type>
          <type>bool</type>
        </tag>'
      end

      let(:param_type) { 'int' }
      let(:param_variable) { '$attachment_id' }
      let(:param_description) { 'Attachment ID' }
      let(:param_types) { ['int', 'string', 'bool'] }

      it_behaves_like 'a param'
    end
  end
end
