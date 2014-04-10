module Dynamo
  class Argument
    attr_accessor :name
    attr_accessor :default
    attr_accessor :type
    attr_accessor :by_reference

    def parse(node)
      parse_by_reference(node)

      node.children.each do |child|
        parse_child(child.name, child)
      end
    end

    def parse_child(name, node)
      value = node.text
      value = nil if value == ''

      self.send("#{name}=", value)
    end

    def parse_by_reference(node)
      self.by_reference = node['by_reference'] == 'true'
    end

    def equal?(arg)
      self.name == arg.name &&
      self.default == arg.default &&
      self.type == arg.type
      self.by_reference == arg.by_reference
    end
  end
end
