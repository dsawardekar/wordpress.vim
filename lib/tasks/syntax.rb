require_relative '../dynamo/loader'
require 'dynamo/app'
require 'erb'
require 'ostruct'

def syntax
  save_syntax(build_syntax)
end

def build_syntax
  opts = OpenStruct.new({
    :generated_syntax => app.build_syntax
  })

  template = syntax_template
  vars = opts.instance_eval { binding }

  template.result(vars)
end

def save_syntax(output)
  File.write(BUILD_SYNTAX_FILE, output)
end

def syntax_template
  ERB.new(File.read(SYNTAX_TEMPLATE))
end
