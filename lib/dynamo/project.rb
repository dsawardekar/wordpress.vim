require 'dynamo/file'

module Dynamo
  class Project
    attr_accessor :title
    attr_accessor :version
    attr_accessor :files

    def parse(node)
      self.title = node['title']
      self.version = node['version']
      self.files = []

      node.children.each do |child|
        case child.name
        when 'file' then parse_file(child)
        end
      end
    end

    def parse_file(node)
      file = Dynamo::File.new
      file.parse(node)

      self.files << file
    end

    def equal?(project)
      self.title == project.title &&
      self.version == project.version &&
      self.equal_files(project)
    end

    def equal_files(project)
      return false if project.files.length != self.files.length

      project.files.each_with_index do |file, index|
        return false unless file.equal?(self.files[index])
      end

      true
    end
  end
end
