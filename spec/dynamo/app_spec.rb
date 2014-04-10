require 'spec_helper'
require 'dynamo/app'
require 'dynamo/project_scanner'
require 'dynamo/syntax_generator'

module Dynamo
  describe App do
    let(:app) do
      App.new
    end

    let(:path) do
      'build/phpdocs/structure.xml'
    end

    it 'has a singleton instance' do
      app1 = App.instance
      app2 = App.instance

      expect(app1).to eq(app2)
    end

    it 'has a project scanner' do
      expect(app.project_scanner).to be_a(ProjectScanner)
    end

    it 'has a syntax generator' do
      expect(app.syntax_generator).to be_a(SyntaxGenerator)
    end

    it 'can load structure xml' do
      expect(app.fetch(path)).to_not be_empty
    end

    it 'can parse struture xml' do
      node = app.parse(app.fetch(path))
      expect(node['title']).to_not be_empty
    end

    it 'can load project from structure' do
      project = app.load(app.parse(app.fetch(path)))
      expect(project.title).to eq('API Documentation')
    end

    it 'can scan loaded project' do
      project = app.load(app.parse(app.fetch(path)))
      app.scan(project)

      expect(app.syntax_generator.functions.length).to be > 1
    end

    it 'can prepare project from structure' do
      project = app.prepare(path)
      expect(project.files.length).to be > 1
    end

    it 'won\'t prepare scanned project' do
      app.prepare(path)
      expect(app.prepare(path)).to be_false
    end

    it 'can build syntax file' do
      app.prepare(path)
      output = app.build_syntax

      expect(output).to_not be_empty
    end

    it 'can build functions dict' do
      app.prepare(path)
      output = app.build_functions_dict

      expect(output).to_not be_empty
    end

    it 'can build classes dict' do
      app.prepare(path)
      output = app.build_classes_dict

      expect(output).to_not be_empty
    end

    it 'can build functions module' do
      app.prepare(path)
      output = app.build_functions_module

      expect(output).to_not be_empty
    end

    it 'can build classes module' do
      app.prepare(path)
      output = app.build_classes_module

      expect(output).to_not be_empty
    end

    # should be ok to just test if output is present
    # the earlier tests have covered the tricky parts
    # TODO: revisit this if we run into errors
  end
end
