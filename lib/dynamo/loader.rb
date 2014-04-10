module Dynamo

  module Loader
    ROOT_DIR = File.expand_path('../../../', __FILE__)
    LIB_DIR = File.join(ROOT_DIR, 'lib')

    $:.unshift(LIB_DIR) unless $:.include? LIB_DIR
  end

end
