require 'dynamo/syntax_generator'
require 'dynamo/project_scanner'
require 'dynamo/project'
require 'nokogiri'
require 'dynamo/function_dict_generator'
require 'dynamo/class_dict_generator'

module Dynamo

  class App
    @@app = nil

    attr_accessor :project_scanner
    attr_accessor :syntax_generator
    attr_accessor :function_dict_generator
    attr_accessor :class_dict_generator
    attr_accessor :prepared

    def self.instance
      self.app = App.new if self.app.nil?
      self.app
    end

    def self.app=(obj)
      @@app = obj
    end

    def self.app
      @@app
    end

    def initialize
      self.project_scanner         = ProjectScanner.new
      self.syntax_generator        = SyntaxGenerator.new
      self.function_dict_generator = FunctionDictGenerator.new
      self.class_dict_generator    = ClassDictGenerator.new

      self.project_scanner.add_observer(self.syntax_generator)
      self.project_scanner.add_observer(self.function_dict_generator)
      self.project_scanner.add_observer(self.class_dict_generator)

      self.prepared = false
    end

    # public API
    def prepare(structure_path)
      return false if self.prepared

      text     = fetch(structure_path)
      xml_node = parse(text)
      project  = load(xml_node)
      scan     = scan(project)

      self.prepared = true
      project
    end

    def build_syntax
      syntax_generator.build
    end

    def build_functions_dict
      function_dict_generator.build
    end

    def build_functions_module
      function_dict_generator.build_module_list
    end

    def build_classes_dict
      class_dict_generator.build
    end

    def build_classes_module
      class_dict_generator.build_module_list
    end

    # helpers
    def fetch(path)
      ::File.read(path)
    end

    def parse(text)
      xml = Nokogiri::XML.parse(text) do |config|
        config.noblanks
      end

      xml.root
    end

    def load(node)
      project = Project.new
      project.parse(node)
      project
    end

    def scan(project)
      project_scanner.scan(project)
    end

  end
end
