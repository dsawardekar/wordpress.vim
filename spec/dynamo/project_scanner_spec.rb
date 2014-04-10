require 'spec_helper'
require 'dynamo/project'
require 'dynamo/file'
require 'dynamo/function'
require 'dynamo/class'
require 'dynamo/syntax_generator'
require 'dynamo/project_scanner'

module Dynamo
  describe ProjectScanner do
    it 'can find functions in project' do
      project = Project.new

      files = []
      file = File.new
      file.path = 'shortcode.php'
      files << file

      functions = []

      function = Function.new
      function.name = 'add_shortcode'
      functions << function

      function = Function.new
      function.name = 'remove_shortcode'
      functions << function

      file.functions = functions
      file.classes = []
      project.files = files

      scanner = ProjectScanner.new
      generator = SyntaxGenerator.new
      scanner.add_observer(generator)

      scanner.scan(project)
      output = generator.build

      expect(output).to match(/syn keyword wpFunction add_shortcode/)
      expect(output).to match(/syn keyword wpFunction remove_shortcode/)
    end

    it 'can find classes in project' do
      project = Project.new

      files = []
      file = File.new
      file.path = 'shortcode.php'
      files << file

      file.functions = []

      classes = []
      klass = Class.new
      klass.name = 'Lorem'
      classes << klass

      klass = Class.new
      klass.name = 'Ipsum'
      classes << klass

      file.classes = classes
      project.files = files

      scanner = ProjectScanner.new
      generator = SyntaxGenerator.new
      scanner.add_observer(generator)

      scanner.scan(project)
      output = generator.build

      expect(output).to match(/syn keyword wpClass Lorem/)
      expect(output).to match(/syn keyword wpClass Ipsum/)
    end

    it 'can find deprecated functions in project' do
      project = Project.new

      files = []
      file = File.new
      file.path = 'shortcode.php'
      files << file

      functions = []

      function = Function.new
      function.name = 'add_shortcode'
      function.deprecated = true
      functions << function

      function = Function.new
      function.name = 'remove_shortcode'
      function.deprecated = true
      functions << function

      file.functions = functions
      file.classes = []
      project.files = files

      scanner = ProjectScanner.new
      generator = SyntaxGenerator.new
      scanner.add_observer(generator)

      scanner.scan(project)
      output = generator.build

      expect(output).to match(/syn keyword wpDeprecated add_shortcode/)
      expect(output).to match(/syn keyword wpDeprecated remove_shortcode/)
    end
  end
end
