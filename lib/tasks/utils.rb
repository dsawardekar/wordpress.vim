require_relative 'app'
require_relative 'phpdoc'
require_relative 'syntax'
require_relative 'dict'

def copy_to(from, to)
  to_dir = File.dirname(to)
  to_name = File.basename(to)
  from_name = File.basename(from)

  mkdir_p to_dir
  cp from, to_dir

  new_from = "#{to_dir}/#{from_name}"
  new_to = "#{to_dir}/#{to_name}"

  unless new_from == new_to
    mv new_from, new_to
  end
end

def clean_file(path)
  rm path if File.exists?(path)
end
