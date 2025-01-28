#----------------------- DAY 6: MINI PROJECT -------------------------------------
# Instructions:
  # Create a file named address_book.rb.
  # Program Requirements:
      # The program should display a menu with options:
      # Add a contact
      # View all contacts
      # Search for a contact
      # Exit
  # Add a Contact:
      # Prompt the user for the contact's name, phone number, and email.
      # Store each contact as a hash within an array.
  # View All Contacts:
      # Display all contacts with their details.
  # Search for a Contact:
      # Prompt for the name to search.
      # Display the contact's information if found.

def add_contactlist #CHOICE 1
  add_contact = {} #new hash

  puts "\n Who would you like to add to your contact list? \n"
  add_contact[:name] = gets.chomp
  puts "\n What is #{add_contact[:name]}'s phone number? \n"
  add_contact[:phone_number] = gets.chomp
  puts "\n What is #{add_contact[:name]}'s address? \n"
  add_contact[:address] = gets.chomp
  puts "\n What is #{add_contact[:name]}'s birth date? (MM/DD/YY)?\n"
  add_contact[:birthdate] = gets.chomp

  puts "\n Contact added."
  # puts add_contact

  return add_contact #MAKE SURE PUT RETURN OR ELSE IT WONT ADD DUMMY

end
#{:name=>"Jessica Fernandez", :phone_number=>671, :address=>"Yigo"}
#another way 
#contacts.push {name: "name", email: "email", }
#contacts << {name: "name", email: "email", }

def view_contactlist(vw_contactlist) #Choice 2 view contact list
  puts "\n"
  puts "---------------------------------------"
  puts "\n"
  puts "\n"
    if vw_contactlist.empty? #tells users if contact list is empty
      puts "No contacts available :( "
    else
      vw_contactlist.each do |contact| #each contact
        name = contact[:name] #define name with the dataset "pet"
        phone = contact[:phone_number]
        address = contact[:address]
        birthdate =contact[:birthdate]
      
        puts "Contact: #{name}" #lists each name within data set?
        puts "  Phone number: #{phone}"
        puts "  Address: #{address}"
        puts "  Birthdate: #{birthdate} \n"
      end
    end

  puts "\n"
  puts "\n"
  puts "---------------------------------------"
  puts "\n"
end

def search_contactlist(srch_contactlist)
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
          puts "     Birth date: #{:birthdate}"
        end
        puts "\n"
      end

    elsif srchcontact_intans.downcase == "n"
      break
    else
      puts "\n Invalid entry. Please type y/n. \n"

    end #MAIN IF would you like to remove
  
  end#loop
  
end

def delete_contactlist(dltcntct) #CHOICE 4 #I did this to avoid spellign error/multiple contact with the same first/last name
  loop do
    puts "\n Would you like to remove a contact (y/n) \n"
    dltcontact_intans = gets.chomp.downcase
    puts "\n"

    if dltcontact_intans.downcase == "y"
      puts "\n Which contact would you like to remove?  (#) \n "
      # index - [0, 1, 2, 3,..]
      dltcntct.each_with_index do |contact, index|
          puts "#{index + 1}. #{contact[:name]}" # displays as "1. run"
      end #each do
      
      puts "\n"
      contact_num = gets.chomp.to_i #user input number 
      puts "\n"

      if contact_num <= 0 || contact_num > dltcntct.length #ensures valid input (less than 0 and more than the length of array)
        puts "\n Invalid task number. Please ensure you entered the correct number associate with the contact in the list. \n"
      else #OPTIONAL 3
        puts "\n Are you sure you want to delete this contact? (y/n) \n"
        contact_confirm = gets.chomp.downcase
        puts "\n"
  
        if contact_confirm.downcase == "y"
          contact_action = dltcntct.delete_at(contact_num - 1) #removes the task at the spec index. adjusted for +1
          contact_action
          puts "\n Contact has been removed \n"
        elsif contact_confirm.downcase == "n"
          puts "\n No contact was removed. \n"
          next
        else 
          puts "\n Invalid entry. Please type y/n. \n"
        end #IF confirm deletion

      end #IF ensures valid number entry 

    elsif dltcontact_intans == "n"
      break
    else
      puts "\n Invalid entry. Please type y/n. \n"

    end #MAIN IF would you like to remove
  
  end#loop

end#def

def edit_contactlist(edt_contactlist)
  loop do
    puts "\n Would you like to edit a contact from your list? (y/n) \n"
    editcontact_intans = gets.chomp.downcase
    puts "\n"

    if editcontact_intans.downcase == "y"
      puts "\n Who would you like to edit in your contacts? \n"
      puts "\n"
      edit_contact = gets.chomp.downcase

      matching_contact = edt_contactlist.select do |edtcntct|
        edtcntct[:name].downcase.include?(edit_contact)
      end  

      if matching_contact.empty? #if none found
        puts "\n No contact found. \n"
      else
        puts "\n Which contact would you like to remove?  (#) \n "
      # index - [0, 1, 2, 3,..]
        matching_contact.each_with_index do |contact, index|
            puts "#{index + 1}. #{contact[:name]}" 
        end #displays each matching contact

        puts "\n Which contact would you like to edit? # \n"

        puts "\n"
        contact_num = gets.chomp.to_i #user input number 
        puts "\n"

        if contact_num <= 0 || contact_num > matching_contact.length #ensures valid input (less than 0 and more than the length of array)
          puts "\n Invalid task number. Please ensure you entered the correct number associate with the contact in the list. \n"
        else #OPTIONAL 3
          selected_contact = matching_contact[contact_num - 1] #adjusts for+1 index

          puts "What would you like to edit? \n 1 - Name \n 2 - Phone \n 3 - Address \n 4 - Birth date? \n"
          edit_option = gets.chomp.to_i

          if edit_option == 1 #NAME
            puts "\n New contact name = \n"
            selected_contact[:name] = gets.chomp
          elsif edit_option == 2
            puts "\n New contact phone number = \n"
            selected_contact[contact][:phone_number] = gets.chomp
          elsif edit_option == 3
            puts "\n New contact address = \n"
            selected_contact[contact][:address] = gets.chomp
          elsif edit_option == 4
            puts "\n New contact birthdate = \n"
            selected_contact[contact][:birthdate] = gets.chomp
          else 
          end #edit option

        end #pick contact
          
      end #matching contact

    elsif editcontact_intans.downcase == "n"
      break
    else
      puts "\n Invalid entry. Please type y/n. \n"

    end #MAIN IF would you like to edit
  
  end#loop
  
end

address_book = []

loop do 
  puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" 
  puts "\n Address Book \n \n What would you like to do: \n 1 - Add a contact \n 2 - Delete contact \n 3 - Edit Contact \n 4 - View all contacts \n 5 - Search for a contact \n 6 - Exit \n"
  puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
  puts " \n "
  choice = gets.chomp.to_i

  if choice == 1 #add GOOD TO GO
    address_book.push(add_contactlist)
  
  elsif choice == 2 #view tasks
    delete_contactlist(address_book) 
  
  elsif choice == 3 #edit tasks
    edit_contactlist(address_book) 

  elsif choice == 4 #view tasks
    view_contactlist(address_book) 

  elsif choice == 5 #search for task
    search_contactlist(address_book)
  
  elsif choice == 4 #EXIT
    exit_todolist
   break

  end

end 