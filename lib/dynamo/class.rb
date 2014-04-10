require 'dynamo/method'
require 'dynamo/property'

module Dynamo
  class Class
    attr_accessor :name
    attr_accessor :full_name
    attr_accessor :package
    attr_accessor :namespace
    attr_accessor :abstract
    attr_accessor :extends
    attr_accessor :properties
    attr_accessor :methods

    def parse(node)
      self.package = node['package']
      self.namespace = node['namespace']
      self.abstract = node['abstract'] == 'true'
      self.properties = []
      self.methods = []

      node.children.each do |child|
        case child.name
        when 'extends' then self.extends = child.text
        when 'name' then self.name = child.text
        when 'full_name' then self.full_name = child.text
        when 'property' then parse_property(child)
        when 'method' then parse_method(child)
        end
      end
    end

    def parse_property(node)
      property = Property.new
      property.parse(node)

      self.properties << property
    end

    def parse_method(node)
      method = Method.new
      method.parse(node)

      self.methods << method
    end

    def equal?(klass)
      self.name == klass.name &&
      self.full_name == klass.full_name &&
      self.package == klass.package &&
      self.namespace == klass.namespace &&
      self.abstract == klass.abstract &&
      self.extends == klass.extends &&
      self.equal_properties(klass) &&
      self.equal_methods(klass)
    end

    def equal_properties(klass)
      return false if klass.properties.length != self.properties.length

      klass.properties.each_with_index do |property, index|
        return false unless property.equal?(self.properties[index])
      end

      true
    end

    def equal_methods(klass)
      return false if klass.methods.length != self.methods.length

      klass.methods.each_with_index do |method, index|
        return false unless method.equal?(self.methods[index])
      end

      true
    end

    def properties_to_dict(key, properties)
      output = ''
      if !properties.nil? && properties.length > 0
        output << "\\  '#{key}': {\n"

        properties.each do |property|
          if property.visibility == 'public'
            output << "\\    "
            output << property.to_dict
            output << ",\n"
          end
        end

        output << "\\  },\n"
      end

      output
    end

    def methods_to_dict(key, methods)
      output = ''

      if !methods.nil? && methods.length > 0
        output << "\\  '#{key}': {\n"

        methods.each do |method|
          if method.visibility == 'public'
            output << "\\    "
            output << method.to_dict
            output << ",\n"
          end
        end

        output << "\\  },\n"
      end

      output
    end

    def to_dict
      output = "\\'#{name.downcase}': {\n"
      output << "\\  'name': '#{name}',\n"

      output << properties_to_dict('static_properties', filter_static_properties)
      output << methods_to_dict('static_methods', filter_static_methods)

      output << properties_to_dict('properties', filter_properties)
      output << methods_to_dict('methods', filter_methods)

      output << "\\},\n"
      output
    end

    # grr... copy-pasta...
    def filter_properties
      return [] if properties.nil?

      res = properties.select do |property|
        property.static.nil? ||
        property.static == false
      end

      res.uniq do |property|
        property.name
      end
    end

    def filter_static_properties
      return [] if properties.nil?

      res = properties.select do |property|
        property.static == true
      end

      res.uniq do |property|
        property.name
      end
    end

    def filter_methods
      return [] if methods.nil?

      res = methods.select do |method|
        method.static.nil? ||
        method.static == false
      end

      res.uniq do |method|
        method.name
      end
    end

    def filter_static_methods
      return [] if methods.nil?

      res = methods.select do |method|
        method.static == true
      end

      res.uniq do |method|
        method.name
      end
    end
  end
end
