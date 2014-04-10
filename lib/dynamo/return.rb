module Dynamo
  class Return
    attr_accessor :type
    attr_accessor :types
    attr_accessor :description

    def parse(node)
      self.type = node['type']
      self.description = node['description']
      self.types = []

      node.children.each do |child|
        text = child.text.strip
        if text != ''
          self.types << text
        end
      end
    end

    def equal?(returned)
      self.type == returned.type
      self.description == returned.description &&
      (returned.types & self.types == returned.types)
    end
  end
end
