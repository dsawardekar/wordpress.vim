module Dynamo
  class ClassDictGenerator
    attr_accessor :classes
    attr_accessor :modules
    attr_accessor :did_build

    def initialize
      self.classes = []
      self.modules = []
      self.did_build = false
    end

    def update(action, args)
      method = "found_#{action}"
      self.send(method, *args) if self.respond_to? method
    end

    def found_class(klass, file)
      self.classes << [klass, file]
    end

    def build
      output = ''
      current_file = nil
      closed = false

      classes.each do |obj|
        klass, file = obj

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

        output << klass.to_dict

        current_file = file
      end

      unless closed
        output << "\\}\n"
      end

      self.did_build = true
      output
    end

    def build_module_list
      build unless self.did_build
      output = "let g:wordpress_active_class_extensions = [\n"

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
      "g:phpcomplete_builtin['classes']['#{module_name}']"
    end
  end
end
