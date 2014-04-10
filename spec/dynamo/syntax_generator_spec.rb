require 'spec_helper'
require 'dynamo/syntax_generator'
require 'dynamo/function'
require 'dynamo/class'

module Dynamo
  describe SyntaxGenerator do
    let(:generator) do
      SyntaxGenerator.new
    end

    it 'can receive observer events' do
      generator.stub(:found_foo) do |a, b|
        expect(a).to eq('one')
        expect(b).to eq('two')
      end

      generator.update('foo', ['one', 'two'])
    end

    it 'can stores found functions' do
      func1 = double()
      func2 = double()
      file = double()

      generator.update('function', [func1, file])
      generator.update('function', [func2, file])

      expect(generator.functions[0]).to eq([func1, file])
      expect(generator.functions[1]).to eq([func2, file])
    end

    it 'can store found classes' do
      klass1 = double()
      klass2 = double()
      file = double()

      generator.update('class', [klass1, file])
      generator.update('class', [klass2, file])

      expect(generator.classes[0]).to eq([klass1, file])
      expect(generator.classes[1]).to eq([klass2, file])
    end

    it 'can generate syntax line for function' do
      func = Function.new
      func.name = 'do_foo'
      func_line = 'syn keyword wpFunction do_foo contained'

      expect(generator.syntax_function(func)).to eq(func_line)
    end

    it 'can generate syntax line for class' do
      klass = Class.new
      klass.name = 'Foo'
      klass_line = 'syn keyword wpClass Foo contained'

      expect(generator.syntax_class(klass)).to eq(klass_line)
    end

    def new_function(name)
      func = Function.new
      func.name = name
      func.full_name = name

      func
    end

    it 'can build syntax from functions' do
      file = File.new
      file.path = 'shortcode.php'

      generator.update('function', [new_function('add_shortcode'), file])
      generator.update('function', [new_function('remove_shortcode'), file])

      output = generator.build

      expect(output).to match(/syn keyword wpFunction add_shortcode/)
      expect(output).to match(/syn keyword wpFunction remove_shortcode/)
    end

    it 'can generate syntax file' do
      file = File.new
      file.path = 'shortcode.php'

      generator.update('function', [new_function('add_shortcode'), file])
      generator.update('function', [new_function('remove_shortcode'), file])

      path = 'build/test_shortcode.vim'
      generator.save(path)
      output = ::File.read(path)

      expect(output).to match(/syn keyword wpFunction add_shortcode/)
      expect(output).to match(/syn keyword wpFunction remove_shortcode/)
    end

  end
end
