require_relative "BST"
require_relative "LL"

def clrscr
  system("clear") || system("cls")
end

selected_data_structure = ""
until selected_data_structure == "l" || selected_data_structure == "b"
  clrscr
  puts (
    "\n" +
    "type the option and hit enter\n\n" +
    "(L)inked List\n" +
    "(B)inary Search Tree\n\n"
  )
  selected_data_structure = gets.chomp.downcase
end

data_structure = nil
if selected_data_structure == "l"
  data_structure = LL.new()
else
  data_structure = BST.new()
end

option = ""
until option == "y" || option == "n"
  clrscr
  puts "do you want to load data from a file? [y/n]"
  option = gets.chomp.downcase
end

filename = ""
if option == "y"
  until File.exists?(filename)
    clrscr
    puts "enter a filename containing comma separated numbers"
    filename = gets.chomp
  end
  file = File.open(filename)
  file_data = file.read
  data_array = file_data.split(',')
  data_array.each { |data|
    if (data.to_i != 0) || (data == "0")
      data_structure.insert(data.to_i)
    end
  }
  file.close
end

def print_help(selected_data_structure)
  clrscr
  if selected_data_structure == "b"
    puts (
      "\n" +
      "type the option and hit enter\n\n" +
      "i \tto insert\n" +
      "pr \tto print preorder traversal\n" +
      "in \tto print inorder traversal\n" +
      "po \tto print postorder traversal\n" +
      "le \tto print levelorder traversal\n" +
      "l \tto print largest\n" +
      "s \tto print smallest\n" +
      "f \tto find an element\n" +
      "d \tto delete an element\n" +
      "h \tto show help\n" +
      "q \tto quit\n\n"
    )
  else
    puts (
      "\n" +
      "type the option and hit enter\n\n" +
      "i \tto insert\n" +
      "p \tto print the list\n" +
      "d \tto delete an element\n" +
      "f \tto find an element\n" +
      "r \tto reverse the list\n" +
      "h \tto show help\n" +
      "q \tto quit\n\n"
    )
  end
end

print_help(selected_data_structure)

action = ""
while action != "q"
  action = gets.chomp
  case action
  when "h"
    print_help(selected_data_structure)
  when "i"
    puts "enter comma separated numbers to be inserted"
    data_array = gets.chomp.split(',')
    data_array.each { |data|
      if data.to_i != 0 || (data == "0")
        data_structure.insert(data.to_i)
      end
    }
  when "in"
    if selected_data_structure == "b"
      puts "inorder traversal"
      result = data_structure.inorder_traversal
      puts result == "" ? "data structure empty!!" : result
    end
  when "pr"
    if selected_data_structure == "b"
      puts "preorder traversal"
      result = data_structure.preorder_traversal
      puts result == "" ? "data structure empty!!" : result
    end
  when "po"
    if selected_data_structure == "b"
      puts "postorder traversal"
      result = data_structure.postorder_traversal
      puts result == "" ? "data structure empty!!" : result
    end
  when "le"
    if selected_data_structure == "b"
      puts "levelorder traversal"
      result = data_structure.levelorder_traversal
      puts result == "" ? "data structure empty!!" : result
    end
  when "l"
    if selected_data_structure == "b"
      largest = data_structure.largest
      puts largest&.data ? "largest : #{largest&.data}" : "data structure empty!!"
    end
  when "s"
    if selected_data_structure == "b"
      smallest = data_structure.smallest
      puts smallest&.data ? "smallest : #{smallest&.data}" : "data structure empty!!"
    end
  when "f"
    puts "enter data to be searched"
    data = gets.chomp.to_i
    node = data_structure.find(data)
    puts node&.data ? "found!!" : "not found!!"
  when "d"
    puts "enter data to be deleted"
    data = gets.chomp.to_i
    puts data_structure.delete(data) ? "deleted!!" : "no such element!!"
  when "p"
    if selected_data_structure == "l"
      puts "list"
      result = data_structure.traverse
      puts result == "" ? "data_structure empty!!" : result
    end
  when "r"
    if selected_data_structure == "l"
      puts "reversing the list"
      data_structure.reverse_list
      result = data_structure.traverse
      puts result == "" ? "data_structure empty!!" : result
    end
  when "q"
    puts "do you want to store the data in a file? [y/n]"
    option = ""
    until option == "y" || option == "n"
      clrscr
      puts 'do you want to save data to "output.txt"? [y/n]'
      option = gets.chomp.downcase
    end
    if option == "y"
      File.open("output.txt", "w") { |f|
        output_data = ""
        if selected_data_structure == "l"
          output_data = data_structure.traverse
        else
          output_data = data_structure.levelorder_traversal
        end
        f.write output_data
      }
    end
  end
end