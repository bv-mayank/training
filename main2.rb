require_relative "LL"

def print_help
  puts "\n" +
    "i \tto insert\n" +
    "p \tto print the list\n" +
    "d \tto delete an element\n" +
    "f \tto find an element\n" +
    "r \tto reverse the list\n" +
    "h \tto show help\n" +
    "q \tto quit\n\n"
end

list = LL.new()

print_help

action = ""
while action != "q"
  action = gets.chomp
  case action
  when "h"
    print_help
  when "i"
    puts "enter comma separated values of data to be inserted"
    data_array = gets.chomp.split(',')
    data_array.each { |data|
      if data.to_i != 0 || (data == "0")
        list.insert_last(data.to_i)
      end
    }
  when "p"
    puts "list"
    result = list.print_list
    puts result == "" ? "list empty!!" : result
  when "f"
    puts "enter data to be searched"
    data = gets.chomp.to_i
    node = list.find(data)
    puts node&.data ? "found!!" : "not found!!"
  when "d"
    puts "enter data to be deleted"
    data = gets.chomp.to_i
    puts list.delete(data) ? "deleted" : "no such element"
  when "r"
    puts "reversing the list"
    list.reverse_list
    result = list.print_list
    puts result == "" ? "list empty!!" : result
  when "q"
    # puts "do you want to store the list in a output file? [y/n]"
    # option = gets.chomp
    # if option == "y"
    #   File.open("output.txt", "w") { |f| f.write list.levelorder_traversal }
    # end
  end
end