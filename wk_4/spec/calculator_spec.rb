require_relative '../4.4.tdd'
 
RSpec.describe Calculator do 
  describe '#add' do
    it 'adds two numbers and gets the sum' do 
      calculator = Calculator.new
      expect(calculator.add(2,3)).to eq(5)
    end
  end

  describe '#subtract' do
    it 'subtracts two numbers and gets the difference' do 
      calculator = Calculator.new
      expect(calculator.subtract(2,3)).to eq(-1)
    end
  end

  describe '#multiply' do
    it 'multiplies two numbers and gets the product' do 
      calculator = Calculator.new
      expect(calculator.multiply(2,3)).to eq(6)
    end
  end

  describe '#divide' do
    it 'divides two numbers and gets the quotient' do 
      calculator = Calculator.new
      expect(calculator.divide(2,3)).to eq(0)
      expect(calculator.divde(2,3)).to output("   w/ a remainder of 2")

    end
  end
end
