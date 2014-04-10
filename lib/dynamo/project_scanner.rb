require 'observer'

module Dynamo
  class ProjectScanner
    include Observable

    def scan(project)
      project.files.each do |file|
        file.functions.each do |function|
          unless function.name =~ /^_/
            changed

            if function.deprecated
              notify_observers('deprecated_function', [function, file])
            else
              notify_observers('function', [function, file])
            end
          end
        end

        file.classes.each do |klass|
          changed
          notify_observers('class', [klass, file])
        end
      end
    end
  end
end
