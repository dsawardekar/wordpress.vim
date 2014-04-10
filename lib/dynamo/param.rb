module Dynamo
  class Param
    attr_accessor :type
    attr_accessor :variable
    attr_accessor :description
    attr_accessor :types

    def parse(node)
      self.type        = node['type']
      self.variable    = node['variable']
      self.description = node['description']
      self.types       = []

      node.children.each do |child|
        if child.text.strip != ''
          self.types << child.text
        end
      end
    end

    def equal?(param)
      self.type == param.type &&
      self.variable == param.variable &&
      self.description == param.description &&
      (param.types & self.types == param.types)
    end
  end
end
