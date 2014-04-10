require 'dynamo/app'
require 'erb'
require 'ostruct'

def dict
  save_dict(build_dict)
  #puts build_dict
end

def build_dict
  opts = OpenStruct.new({
    :generated_function_extensions => app.build_functions_dict,
    :generated_class_extensions => app.build_classes_dict,
    :generated_function_modules => app.build_functions_module,
    :generated_class_modules => app.build_classes_module
  })

  template = dict_template
  vars = opts.instance_eval { binding }

  template.result(vars)
end

def save_dict(output)
  File.write(BUILD_DICT_FILE, output)
end

def dict_template
  ERB.new(File.read(DICT_TEMPLATE))
end
