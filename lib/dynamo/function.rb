require 'dynamo/param'
require 'dynamo/return'
require 'dynamo/argument'

module Dynamo

  class Function
    attr_accessor :namespace
    attr_accessor :package
    attr_accessor :name
    attr_accessor :full_name
    attr_accessor :deprecated

    # from <arguments> - typically not enough meta
    attr_accessor :arguments

    # from <docblock><tag name="param"> - better meta
    attr_accessor :params

    # from <docblock><tag name="return"
    attr_accessor :returns

    def parse(node)
      self.namespace = node['namespace']
      self.package = node['package']
      self.arguments = []
      self.params = []
      self.deprecated = false

      node.children.each do |child|
        case child.name
        when 'name' then self.name = child.text
        when 'full_name' then  self.full_name = child.text
        when 'docblock' then parse_docblock(child)
        when 'argument' then parse_argument(child)
        end
      end
    end

    def parse_docblock(docblock)
      docblock.children.each do |child|
        node_name = child.name

        if node_name == 'tag'
          case child['name']
          when 'param' then parse_param(child)
          when 'return' then parse_return(child)
          when 'deprecated' then self.deprecated = true
          end
        end
      end
    end

    def parse_param(node)
      param = Param.new
      param.parse(node)

      self.params << param
    end

    def parse_return(node)
      returned = Return.new
      returned.parse(node)

      self.returns = returned
    end

    def parse_argument(node)
      argument = Argument.new
      argument.parse(node)

      self.arguments << argument
    end

    def equal?(function)
      self.namespace == function.namespace &&
      self.package == function.package &&
      self.name == function.name &&
      self.full_name == function.full_name &&
      self.equal_arguments(function) &&
      self.equal_params(function) &&
      self.equal_returns(function)
    end

    def equal_arguments(function)
      return false if function.arguments.length != self.arguments.length

      function.arguments.each_with_index do |argument, index|
        return false unless argument.equal?(self.arguments[index])
      end

      true
    end

    def equal_params(function)
      return false if function.params.length != self.params.length

      function.params.each_with_index do |param, index|
        return false unless param.equal?(self.params[index])
      end

      true
    end

    def equal_returns(function)
      function.returns.equal?(self.returns)
    end

    def to_dict
      dict = "'#{name}(': "
      args = []

      dict << "'"

      if arguments.length > 0
        arguments.each do |argument|
          args << "#{argument.type} #{argument.name}".gsub("'", '')
        end
        dict << args.join(', ')
      else
        dict << 'void'
      end

      if !returns.nil?
        dict << ' | '
        dict << returns.type
      else
        dict << ' | void'
      end

      dict << "'"

      dict
    end
  end

end
