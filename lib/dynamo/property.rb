module Dynamo
  class Property
    attr_accessor :static
    attr_accessor :visibility
    attr_accessor :name
    attr_accessor :full_name
    attr_accessor :default
    attr_accessor :type

    def parse(node)
      self.static = node['static'] == 'true'
      self.visibility = node['visibility']

      node.children.each do |child|
        case child.name
        when 'name' then self.name = child.text
        when 'full_name' then self.full_name = child.text
        when 'default' then self.default = child.text
        when 'docblock' then self.parse_type(child)
        end
      end
    end

    def parse_type(node)
      node.children.each do |child|
        if child.name == 'tag' && child['name'] == 'var'
          self.type = child['type']
        end
      end
    end

    def equal?(property)
      self.static == property.static &&
      self.visibility == property.visibility &&
      self.name == property.name &&
      self.full_name == property.full_name &&
      self.default == property.default &&
      self.type == property.type
    end

    def to_dict
      output = "'#{name}': "
      output << '{'

      output << "'initializer': '#{to_initializer(default)}'"
      output << ', '
      output << "'type': '#{type}'"

      output << '}'
    end

    def to_initializer(value)
      if value =~ /array\(/
        value = 'array'
      end

      value.gsub("'", '')
    end
  end
end
