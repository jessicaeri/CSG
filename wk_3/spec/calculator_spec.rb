# require_relative '../3.3.testing'
#                     #name of file
# RSpec.describe Calculator do 
#   describe '#add' do
#     it 'returns the sum of two numbers' do #what we expect it to do
#       calculator = Calculator.new
#       expect(calculator.add(2,3)).to eq(5)
#     end
#   end
# end

# Advanced Matchers
# be > / be <
# expect(10).to be > 5

# include
# expect([1, 2, 3]).to include(2)
# expect("hello world").to include("hello")

# match / match_array
# expect("abcdef").to match(/[a-z]+/)
# expect([1,2]).to match_array([2,1])  # order-insensitive

# change
# expect { account.deposit(100) }.to change { account.balance }.by(100)






