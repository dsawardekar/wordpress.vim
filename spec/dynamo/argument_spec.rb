require 'spec_helper'
require 'dynamo/argument'
require 'nokogiri'

module Dynamo

  shared_examples 'an Argument' do
    it 'parses argument name' do
      expect(argument.name).to eq(argument_name)
    end

    it 'parses argument default' do
      expect(argument.default).to eq(argument_default)
    end

    it 'parses argument type' do
      expect(argument.type).to eq(argument_type)
    end

    it 'parses by_reference' do
      expect(argument.by_reference).to eq(argument_by_reference)
    end
  end

  describe Argument do
    let(:node_text) do
      'context-node-text'
    end

    let(:node) do
      xml = Nokogiri::XML.parse(node_text) do |config|
        config.noblanks
      end

      xml.root
    end

    let(:argument) do
      argument = Argument.new
      argument.parse(node)
      argument
    end

    context 'with empty default' do
      let(:node_text) do
        '<argument line="0" by_reference="false">
            <name>$attachment_id</name>
            <default></default>
            <type>int</type>
         </argument>'
      end

      let(:argument_name) { '$attachment_id' }
      let(:argument_default) { nil }
      let(:argument_type) { 'int' }
      let(:argument_by_reference) { false }

      it_behaves_like 'an Argument'
    end

    context 'with valid default' do
      let(:node_text) do
        '<argument line="0" by_reference="false">
            <name>$attachment_id</name>
            <default>foo</default>
            <type>int</type>
         </argument>'
      end

      let(:argument_name) { '$attachment_id' }
      let(:argument_default) { 'foo' }
      let(:argument_type) { 'int' }
      let(:argument_by_reference) { false }

      it_behaves_like 'an Argument'
    end

    context 'with missing type' do
      let(:node_text) do
        '<argument line="0" by_reference="false">
            <name>$attachment_id</name>
            <default>foo</default>
         </argument>'
      end

      let(:argument_name) { '$attachment_id' }
      let(:argument_default) { 'foo' }
      let(:argument_type) { nil }
      let(:argument_by_reference) { false }

      it_behaves_like 'an Argument'
    end

    context 'with pass by reference' do
      let(:node_text) do
        '<argument line="0" by_reference="true">
            <name>$attachment_id</name>
         </argument>'
      end

      let(:argument_name) { '$attachment_id' }
      let(:argument_default) { nil }
      let(:argument_type) { nil }
      let(:argument_by_reference) { true }

      it_behaves_like 'an Argument'
    end
  end

end
