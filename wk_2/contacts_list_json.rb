#------------------------Week 2: Day 5 ACTIVITY -----------------

#Task: Enhance the contact management program using Enumerables.
# Instructions:
    # Get the contact_list.rb and contacts.json files and create individual files for them.
    # Get it running locally (test it to make sure it works as expected).
  
    # Implement at least two of the following:
        # Implement a feature to search for contacts by name using select.
        # Implement a feature to list all contacts in alphabetical order using sort.
        # Implement a feature to count the total number of contacts using count or length.

require 'json'
contacts = []

begin
    file = File.open("save_contacts.json", "r")
    contacts = JSON.parse(file.read, symbolize_names: true) # weird rule 
    puts "Contacts uploaded."
rescue Errno::ENOENT
    puts "File not found."
rescue JSON::ParserError
    puts "Error parsing json data."
ensure 
    file.close if file 
end

def save_contacts(people)
    begin
      file = File.open("save_contacts.json", "w")
      file.write(JSON.pretty_generate(people)) #formats it appropriately
      puts "Contacts saved."
    rescue IOError => e
      puts "An error occurred while saving contacts: #{e.message}"
    ensure
      file.close if file
    end
end
  
loop do
    puts "\nContact List Menu:"
    puts "1. Add contact"
    puts "2. Remove contact"
    puts "3. View contacts"
    puts "4. Exit"
    puts "Enter your choice: "
    choice = gets.chomp.to_i
  
    case choice #easier to read than multiple if-else functions
    when 1
        puts "Enter contact name: "
        name = gets.chomp
        puts "Enter contact phone number: "
        phone = gets.chomp
        puts "Enter contact email: "
        email = gets.chomp
        contacts.push({ name: name, phone: phone, email: email })
        puts "Contact added."
      when 2
        loop do
            puts "\n Would you like to search for a contact from your list? (y/n) \n"
            srchcontact_intans = gets.chomp.downcase
            puts "\n"
        
            if srchcontact_intans.downcase == "y"
              puts "\n Who would you like to search for? \n"
              puts "\n"
              search_contact = gets.chomp.downcase
        
              matching_contact = srch_contactlist.select do |srchcntct|
                srchcntct[:name].downcase.include?(search_contact)
              end  #.select do is used for more complex codes/blocks of codes. .select {} is for one line codes/arrays.
        
              if matching_contact.empty? #if none found
                puts "\n No contact found. \n"
              else
                puts "\n Matching contact(s):"
                matching_contact.each_with_index do |contact, index|
                  puts "#{index +1}. #{contact[:name]}" #adjusts for 0 index
                  puts "     Phone: #{:phone_number}"
                  puts "     Address: #{:address}"
                end
                puts "\n"
              end
        
            elsif srchcontact_intans.downcase == "n"
              break
            else
              puts "\n Invalid entry. Please type y/n. \n"
        
            end #MAIN IF would you like to remove
        end 
      when 3
        puts "Contact List:"
        contacts.each_with_index do |contact, index|
          puts "#{index + 1}. #{contact[:name]} - #{contact[:phone]} - #{contact[:email]}"
        end
      when 4
        puts "Goodbye!"
        save_contacts(contacts)
        break
      else
        puts "Invalid choice. Please try again."
      end
end