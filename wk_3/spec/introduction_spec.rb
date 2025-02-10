require_relative '../3.4.modules'

RSpec.describe Introduction do
  class Person
    include Introduction

    def initialize(name, age)
      @name = name
      @age = age
    end
  end

  subject { Person.new("Leon",25) }

  describe '#introduce_name' do
    it 'return the correct introduction message for name' do
      expect(subject.introduce_name).to eq("Hello, my name is Leon")
    end
  end

  describe '#introduce_age' do
    it 'return the correct introduction message for age' do
      expect(subject.introduce_age).to eq("I am 25 years old")
    end
  end
end