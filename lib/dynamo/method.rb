require 'dynamo/function'

module Dynamo
  class Method < Function
    attr_accessor :static
    attr_accessor :visibility
    attr_accessor :abstract

    def parse(node)
      super(node)

      self.static = node['static'] == 'true'
      self.abstract = node['abstract'] == 'true'
      self.visibility = node['visibility']
    end

    def equal?(method)
      self.static == method.static &&
      self.visibility == method.visibility &&
      self.abstract == method.abstract &&
      super(method)
    end

    def to_dict
      output = ''
      output << "'#{name}'"
      output << ': '
      output << '{'

      output << " 'signature': "

      if arguments.length > 0
        output << "'"
        args = []
        arguments.each do |argument|
          args << "#{argument.type} #{argument.name}".gsub("'", '')
        end
        output << args.join(', ')
        output << "'"
      else
        output << "'void'"
      end

      output << ', '
      output << "'return_type': "
      output << "'"

      if !returns.nil?
        output << returns.type
      else
        output << 'void'
      end

      output << "'"
      output << '}'

      output
    end
  end
end
