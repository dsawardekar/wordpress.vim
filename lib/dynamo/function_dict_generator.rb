module Dynamo
  class FunctionDictGenerator
    attr_accessor :functions
    attr_accessor :modules
    attr_accessor :did_build

    def initialize
      self.functions = []
      self.modules = []
      self.did_build = false
    end

    def update(action, args)
      method = "found_#{action}"
      self.send(method, *args) if self.respond_to? method
    end

    def found_function(function, file)
      self.functions << [function, file]
    end

    def build
      output = ''
      current_file = nil
      closed = false

      functions.each do |obj|
        function, file = obj

        if current_file != file
          if current_file != nil
            closed = true
            output << "\\}\n"
          end

          if closed
            output << "\n"
          end


          module_name = filename_to_key(file.path)
          self.modules << module_name
          output << "let #{viml_variable(module_name)} = {\n"
          closed = false
        end

        output << "\\ "
        output << function.to_dict
        output << ",\n"

        current_file = file
      end

      unless closed
        output << "\\}"
      end

      self.did_build = true
      output
    end

    def build_module_list
      build unless self.did_build
      output = "let g:wordpress_active_function_extensions = [\n"

      modules.each do |module_name|
        output << "\\ "
        output << "'#{module_name}'"
        output << ",\n"
      end

      output << "\\]"

      output
    end

    def filename_to_key(path)
      basename = ::File.basename(path, '.php')
      basename.gsub!(/[-.]/, '_')

      "wp_#{basename.downcase}"
    end

    def viml_variable(module_name)
      "g:phpcomplete_builtin['functions']['#{module_name}']"
    end

  end
end
