require 'builder'

# builds phpdoc command
def build_phpdoc_config
  xml = Builder::XmlMarkup.new(:indent=>2)
  xml.instruct!

  xml = xml.phpdoc do |phpdoc|
    phpdoc.parser do |parser|
      parser.target File.expand_path(BUILD_PHPDOC_CACHE_DIR)
    end

    phpdoc.transformer do |transformer|
      transformer.target File.expand_path(BUILD_PHPDOC_DIR)
    end

    phpdoc.transformations do |transformations|
      transformations.template('name' => 'xml')
    end

    phpdoc.files do |files|
      PHPDOC_INCLUDES.each do |item|
        path = "#{WORDPRESS_DIR}/#{item}"
        if File.directory?(path)
          files.directory item
        elsif File.file?(path)
          files.file item
        end
      end
    end

    phpdoc.logging do |logging|
      logging.level 'error'
    end
  end

  xml
end

def save_phpdoc_config
  File.write(BUILD_PHPDOC_CONFIG, build_phpdoc_config)
end

def phpdoc
  save_phpdoc_config

  cmd = "#{Dir.pwd}/#{PHPDOC} run"
  cmd
end
