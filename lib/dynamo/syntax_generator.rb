module Dynamo
  class SyntaxGenerator
    attr_accessor :functions
    attr_accessor :classes
    attr_accessor :deprecated_functions
    attr_accessor :current_file

    def initialize
      self.functions = []
      self.classes = []
      self.deprecated_functions = []
      self.current_file = nil
    end

    def update(action, args)
      self.send("found_#{action}", *args)
    end

    def found_function(function, file)
      self.functions << [function, file]
    end

    def found_class(klass, file)
      self.classes << [klass, file]
    end

    def found_deprecated_function(function, file)
      self.deprecated_functions << [function, file]
    end

    def build
      output = ''

      output << build_functions
      output << "\n"
      output << build_classes
      output << "\n"
      output << build_deprecated_functions

      output
    end

    def build_functions
      output = "\" --- Functions --- \n"

      self.functions.each do |obj|
        function, file = obj

        if file != self.current_file
          output << "\n"
          output << "\" #{file.path} \n"
          self.current_file = file
        end

        output << syntax_function(function)
        output << "\n"
      end

      output
    end

    def build_classes
      output = "\" --- Classes --- \n"

      self.classes.each do |obj|
        klass, file = obj

        if file != self.current_file
          output << "\n"
          output << "\" #{file.path} \n"
          self.current_file = file
        end

        output << syntax_class(klass)
        output << "\n"
      end

      output
    end

    def build_deprecated_functions
      output = "\" --- Deprecated Functions --- \n"

      self.deprecated_functions.each do |obj|
        function, file = obj

        if file != self.current_file
          output << "\n"
          output << "\" #{file.path} \n"
          self.current_file = file
        end

        output << syntax_deprecated_function(function)
        output << "\n"
      end

      output
    end

    def save(path)
      ::File.write(path, build)
    end

    def syntax_function(function)
      "syn keyword wpFunction #{function.name} contained"
    end

    def syntax_deprecated_function(function)
      "syn keyword wpDeprecated #{function.name} contained"
    end

    def syntax_class(klass)
      "syn keyword wpClass #{klass.name} contained"
    end

  end
end
