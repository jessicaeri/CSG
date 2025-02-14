require_relative '../4.2.adv_spec'

# RSpec.describe Library do
#   let(:member) { "John Doe" }
#   let(:library) { Library.new(member) }

#   describe '#initialize' do
#       it 'initializes a library with a member' do
#           expect(library.member).to eq(member)
#           expect(library.library).to eq([])
#       end
#   end

#   describe '#fetch_books_from_api' do
#       context 'when the book is in the library' do
#           it 'removes the book from the library and displays a message' do
#               library.library << 'The Great Gatsby'
#               expect { library.fetch_books_from_api('The Great Gatsby') }
#                   .to output("Enjoy your book #{member}!\n").to_stdout
#               expect(library.library).to_not include('The Great Gatsby')
#           end
#       end

#       context 'when the book is not in the library' do
#           it 'displays a book not found message' do
#               expect { library.fetch_books_from_api('Moby Dick') }
#                   .to output("Book not found within library.\n").to_stdout
#               expect(library.library).to eq([])
#           end
#       end
#   end
# end

#got from chatgpt

#LEON's code vvvv
RSpec.describe Library do
    let(:library) { Library.new }
  
    describe '#books' do
      it 'returns a list of books' do
        allow(library).to receive(:fetch_books_from_api).and_return(["Stubbed Book 1", "Stubbed Book 2"])
        # @books = fetch_books_from_api # = ["Stubbed Book 1", "Stubbed Book 2"]
        expect(library.books).to eq(["Stubbed Book 1", "Stubbed Book 2"])
      end
    end
  end