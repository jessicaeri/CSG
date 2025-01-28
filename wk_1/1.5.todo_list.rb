# --------------------- DAY  5-------------------------------

# Question of the Day: What aspect of Guam do you love about?
# No matter where you are on Guam, you are less than 30 mins away from the beach.

#Hotkey of the day: CMD + space opens spotlight search 

#------------------ EXERCISE: To-do list ----------------------

#psuedocode
#I need to make one big to-do list 
#1. use the shopping list as a frame work for your options "arrays"
#2. use the grading methods
#3.  puts "[x]" on specific task 
#4. Delete task .delete
#5. exit = break 

def updated_todolist
  puts "\n"
    puts "To-do list has been updated."
end

def add_todolist #CHOICE 4
  puts "\n What task would you like to add to your to-do list? \n"
  add_task = gets.chomp.downcase
  return "#{add_task} [ ]"
  # 
  # loop do 
  #   puts "Would you like to add a task to your to-do list? (y/n)"
  #   addtsk_intans = gets.chomp.downcase
  #   puts "\n"

  #   if addtsk_intans.downcase == "y"
  #     puts "\n What task would you like to add to your to-do list? \n"
  #     add_task = gets.chomp.downcase
  #     return add_task

  #     puts "WOuld you like to add another task?" #too much just delete
  #     break unless continue == "y"
  #   elsif addtsk_intans.downcase == "n"
  #     break
  #   else
  #     puts "Invalid entry. Please type y/n. \n"
  #   end #MAIN IF would you like to remove
  
    

  # end#loop

end#def                                     
  


def view_todolist(vw_task) #Choice 2 view task #tsk is todo_list
  puts "\n"
  puts "---------------------------------------"
  puts "\n"
  puts "\n"
  
  vw_task.each_with_index do |vwtsk, index| #creates list from array
    puts "#{index +1}. #{vwtsk}" #displays so that list starts with 0
  end

  puts "\n"
  puts "\n"
  puts "---------------------------------------"
  puts "\n"
end

def complete_todolist(cmptsk) #CHOICE 4
  loop do
    puts "\n Would you like to mark a task complete from your to-do list? (y/n) \n"
    cmpltsk_intans = gets.chomp.downcase
    puts "\n"

    if cmpltsk_intans.downcase == "y"
      puts "\n Which task number would you like to mark as completed? \n "
      # index - [0, 1, 2, 3,..]
      cmptsk.each_with_index do |cmptask, index|
          puts "#{index + 1}. #{cmptask}" # displays as "1. run"
      end
    
      puts "\n"
      cmptsk_num = gets.chomp.to_i
      puts "\n"
    
      if cmptsk_num <= 0 || cmptsk_num > cmptsk.length #validates that use input is NOT less than 0 and more than array length 
        puts "Invalid task number. Please ensure you entered the correct number. \n"
      else 
        index = cmptsk_num - 1 #adjusts for index 0
        if cmptsk[index].include?("[ ]") #if the input has []
          cmptsk[index] = cmptsk[index].sub("[ ]", "[X]") #substitute for [X]
        puts "\n #{cmptsk[index]} has been marked as completed! \n"
        else 
        end
      end
    
    elsif cmpltsk_intans.downcase == "n"
      break
    else
      puts "\n Invalid entry. Please type y/n. \n"

    end #MAIN IF would you like to remove
  
  end#loop

end#def


def remove_todolist(rmtsk) #CHOICE 4
  loop do
    puts "\n Would you like to remove a task from your to-do list? (y/n)"
    rmtsk_intans = gets.chomp.downcase
    puts "\n"

    if rmtsk_intans.downcase == "y"
      puts "\n Which task number would you like to remove from your to-do list?   \n "
      # index - [0, 1, 2, 3,..]
      rmtsk.each_with_index do |rmtask, index|
          puts "#{index + 1}. #{rmtask}" # displays as "1. run"
      end #each do
      
      puts "\n"
      rmtsk_num = gets.chomp.to_i #user input number 
      puts "\n"

      if rmtsk_num <= 0 || rmtsk_num > rmtsk.length #ensures valid input (less than 0 and more than the length of array)
        puts "\n Invalid task number. Please ensure you entered the correct number. \n"
      else #OPTIONAL 3
        puts "\n Are you sure you want to delete this task? (y/n) \n"
        rmtsk_confirm = gets.chomp.downcase
        puts "\n"
  
        if rmtsk_confirm.downcase == "y"
          rmtsk_action = rmtsk.delete_at(rmtsk_num - 1) #removes the task at the spec index. #[0walk, 1run, 3eat] 2-1 = 1 = run 
          puts "\n #{rmtsk_action} has been removed \n"
        elsif rmtsk_confirm.downcase == "n"
          puts "\n No task was removed. \n"
          next
        else 
          puts "\n Invalid entry. Please type y/n. \n"
        end #IF confirm deletion

      end #IF ensures valid number entry 

    elsif rmtsk_intans.downcase == "n"
      break
    else
      puts "\n Invalid entry. Please type y/n. \n"

    end #MAIN IF would you like to remove
  
  end#loop

end#def

def exit_todolist 
  puts "\n"
  puts "---------------------------------------"
  puts "\n"
  puts "\n"
  puts "            Goodluck on your tasks!!!!"
  puts " 
                ***          ***                     
              ***....**     **...***                  
             **........** **.......**                 
      ***    **..........*.........**    ***
   **.....**  **..................**  **.....**
 **.........**  **..............**  **.........**
*..............*   *..........*   *..............*
 **..............*   *......*   *..............**
   **..............** *....* **..............**
     *......................................*
   **..............**........**..............**
 **..............*    *....*....*..............**
*..............*    *........* ...*..............*
 **.........**    *............* ...**.........**
   **.....**   **...............**....**.....**
      ***    **...................**.....***
           **...........*...........**....*
            **.........* *.........** *......*..*..*
              *......**   **......*     *........*
                **  *       * **           *...*
                                              *
"
  puts "\n"
  puts "\n"
  puts "---------------------------------------"
end

def search_todolist(srchtsk)
  loop do
    puts "\n Would you like to search for a task from your to-do list? (y/n) \n"
    srchtsk_intans = gets.chomp.downcase
    puts "\n"

    if srchtsk_intans.downcase == "y"
      puts "\n What task would you like to search for? \n"
      puts "\n"
      search_task = gets.chomp.downcase

      matching_tasks = srchtsk.select {|searchtask| searchtask.downcase.include?(search_task)} #.select filters the array to only show those that meet the user's condition "search_task"

      if matching_tasks.empty? #if none found
        puts "\n No tasks found. \n"
      else
        puts "\n Matching tasks:"
        matching_tasks.each_with_index do |task, index|
          puts "#{index +1}. #{task}"
        end
        puts "\n"
      end

    elsif srchtsk_intans.downcase == "n"
      break
    else
      puts "\n Invalid entry. Please type y/n. \n"

    end #MAIN IF would you like to remove
  
  end#loop
  
end

def delete_completed_todolist(dltcmplttsk)
  loop do
    puts "\n Would you like to delete all completed tasks? (y/n) \n"
    dltdcmptsk_intans = gets.chomp.downcase
    puts "\n"

    dlt_complted_task = dltcmplttsk.reject!{|dltcmplt| dltcmplt.include?("[X]")} #deletes all [X] (condition) found within array
      if dlt_complted_task
        puts "\n All completed tasks have been deleted. GREAT JOB!!! \n"
      else
        puts "\n No completed taks found to delete :( \n"
      end

    if dltdcmptsk_intans.downcase == "y"
      dltcmplttsk.include?("[X]")
      
    elsif dltdcmptsk_intans.downcase == "n"
      break
    else
      puts "\n Invalid entry. Please type y/n. \n"

    end #MAIN IF would you like to remove
  
  end#loop 

  
end

todo_list = []

loop do 
  puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" 
  puts "\n To-Do List \n What would you like to do: \n 1 - Add a task \n 2 - Remove task \n 3 - Mark task as completed \n 4 - Clear all completed tasks \n 5 - Search for a task \n 6 - View tasks \n 7 - Exit \n"
  puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
  choice = gets.chomp.to_i

  if choice == 1 #add GOOD TO GO
    todo_list.push(add_todolist)
    puts updated_todolist

  elsif choice == 2 #Remove
    remove_todolist(todo_list)

  elsif choice == 3 #Mark complete
    puts complete_todolist(todo_list)

  elsif choice == 4 #Delete complete
    delete_completed_todolist(todo_list)

  elsif choice == 5 #search for task
    search_todolist(todo_list)
  
  elsif choice == 6 #view tasks
    view_todolist(todo_list)
  
  elsif choice == 7 #EXIT
    exit_todolist
   break
  end

end 
