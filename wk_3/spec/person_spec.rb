require_relative '../3.3.testing'
#usually if the method/class would have more logic we'd separate them into their respective folders.. 
#SYNTAX IS SO IMPORTANT

# RSpec.describe Person do 
#   describe '#initialize' do
#     it 'creates a new Person with a name and age' do 
#       person = Person.new("Alanna", 23)
#           #ensure setter and getter are placed within OG file/class
#       expect(person.name).to eq("Alanna")
#       expect(person.age).to eq(23)
#     end

#     it 'raises an error if age is negative' do
#       expect {Person.new("Jess", -1)}.to raise_error(ArgumentError, 'Age must be a positive number')
#     end
#   end

#   describe '#introduce' do
#     it 'introduces the new person created in initialize' do 
#       person = Person.new("Alanna", 23)
#       expect(person.introduce).to eq("Hello my name is Alanna and I am 23!")
#     end
#   end

# end

#We can a make a more concise version

RSpec.describe Person do 
  let(:person) {Person.new("Noah", 25)}

  it "has a name" do 
    expect(person.name).to eq("Noah")
  end

  it "has an age" do 
    expect(person.age).to eq(25)
  end
end


RSpec.describe Student do 
  describe '#initialize' do
    it 'creates a new Student with a name, age, and grade level' do 
      student = Student.new("Alanna", 23, "12th")
      expect(student.name).to eq("Alanna")
      expect(student.age).to eq(23)
      expect(student.grade_level).to eq("12th")
    end
  end

  describe '#introduce' do
    it 'introduces the new Student created in initialize' do 
      student = Student.new("Alanna", 23, "12th")
      expect(student.introduce).to eq("Hello my name is Alanna and I am 23! I am currently a 12th grader.")
    end
  end

end

RSpec.describe Teacher do 
  describe '#initialize' do
    it 'creates a new Teacher with a name, age, and subject they teach' do 
      teacher = Teacher.new("Jess", 26, "science")
      expect(teacher.name).to eq("Jess")
      expect(teacher.age).to eq(26)
      expect(teacher.teach_subject).to eq("science")
    end
  end

  describe '#introduce' do
    it 'introduces the new Teacher created in initialize' do 
      teacher = Teacher.new("Jess", 26, "science")
      expect(teacher.introduce).to eq("Hello my name is Jess and I am 26! I am currently teaching science.")
    end
  end

end