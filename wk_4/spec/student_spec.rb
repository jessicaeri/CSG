require_relative '../adv_rspec'

RSpec.describe Student do 
  let (:student){Student.new("Noah")}

  describe '#average_grade' do
    it 'calculates the average grade' do 
      student.grades = [90,80,70]
      expect(student.average_grade).to eq(80)
    end

    it 'returns 0 when there are no grades' do
      expect(student.avergae_grade).to eq(0)
    end

    #STUBBING
    it 'uses a stub to simulate grades' do 
        #hard coding so that it is mocking the data so that you'd still be able to test it without data inputted by user.
        
      allow(student).to receive(:grades).and_return([100,100,100])
      expect(student.average_grade).to eq(100)
          #allow student to receive (API) and return ([ADDED DATA (fictional data you put in)]) to behave (calculate to 100)
    end
  end
end