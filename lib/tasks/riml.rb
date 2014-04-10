require 'find'

def build_riml_path(dirs, pattern = /.*\.riml$/)
  libs = []
  dirs.each do |dir|
    Find.find(dir) do |path|
      if path =~ pattern
        libs << File.dirname(path)
      end
    end
  end

  libs.uniq.join(':')
end
