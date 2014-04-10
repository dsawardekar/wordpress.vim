require 'spec_helper'
require 'nokogiri'
require 'dynamo/return'

module Dynamo
  shared_examples 'a Return' do
    it 'parses return type' do
      expect(returned.type).to eq(returned_type)
    end

    it 'parses return description' do
      expect(returned.description).to eq(returned_description)
    end

    it 'parses return types' do
      expect(returned.types).to eq(returned_types)
    end
  end

  describe Return do
    let(:node) do
      xml = Nokogiri::XML.parse(node_text) do |config|
        config.noblanks
      end

      xml.root
    end

    let(:returned) do
      returned = Return.new
      returned.parse(node)
      returned
    end

    context 'with empty return' do
      let(:node_text) do
        '<tag name="return" line="388" description="WP_Post" type="WP_Post|null">
        </tag>'
      end

      let(:returned_type) { 'WP_Post|null' }
      let(:returned_description) { 'WP_Post' }
      let(:returned_types) { [] }

      it_behaves_like 'a Return'
    end

    context 'with single return' do
      let(:node_text) do
        '<tag name="return" line="388" description="WP_Post" type="WP_Post">
          <type>WP_Post</type>
        </tag>'
      end

      let(:returned_type) { 'WP_Post' }
      let(:returned_description) { 'WP_Post' }
      let(:returned_types) { ['WP_Post'] }

      it_behaves_like 'a Return'
    end

    context 'with multiple returns' do
      let(:node_text) do
        '<tag name="return" line="388" description="WP_Post" type="WP_Post">
          <type>WP_Post</type>
          <type>null</type>
          <type>bool</type>
        </tag>'
      end

      let(:returned_type) { 'WP_Post' }
      let(:returned_description) { 'WP_Post' }
      let(:returned_types) { ['WP_Post', 'null', 'bool'] }

      it_behaves_like 'a Return'
    end
  end
end
