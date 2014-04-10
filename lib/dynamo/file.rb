require 'dynamo/function'
require 'dynamo/class'

module Dynamo
  class File
    attr_accessor :path
    attr_accessor :package
    attr_accessor :functions
    attr_accessor :classes

    def parse(node)
      self.path = node['path']
      self.package = node['package']
      self.functions = []
      self.classes = []

      node.children.each do |child|
        case child.name
        when 'function' then parse_function(child)
        when 'class' then parse_class(child)
        end
      end
    end

    def parse_function(node)
      function = Function.new
      function.parse(node)

      self.functions << function
    end

    def parse_class(node)
      klass = Class.new
      klass.parse(node)

      self.classes << klass
    end

    def equal?(file)
      self.path == file.path &&
      self.package == file.package &&
      self.equal_functions(file) &&
      self.equal_classes(file)
    end

    def equal_functions(file)
      return false unless file.functions.length == self.functions.length

      file.functions.each_with_index do |function, index|
        return false unless function.equal?(self.functions[index])
      end

      true
    end

    def equal_classes(file)
      return false unless file.classes.length == self.classes.length

      file.classes.each_with_index do |klass, index|
        return false unless klass.equal?(self.classes[index])
      end

      true
    end
  end
end
