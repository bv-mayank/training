require_relative "LL"

def print_help
  puts "\n" +
    "i \tto insert\n" +
    "pr \tto print \n" +
    "d \tto delete an element\n" +
    "h \tto show help\n" +
    "q \tto quit\n\n"
end

tree = BST.new()

puts "do you want to load tree from a file? [y/n]"
option = gets.chomp
if option == "y"
  puts "enter filename"
  filename = gets.chomp
  if File.exists?(filename)
    file = File.open(filename)
    file_data = file.read
    data_array = file_data.split(',')
    data_array.each { |data|
      if data.to_i != 0 || (data == "0")
        tree.insert(data.to_i)
      end
    }
    file.close
  else
    puts "no such file!!"
  end
end

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
        tree.insert(data.to_i)
      end
    }
  when "in"
    puts "inorder traversal"
    result = tree.inorder_traversal
    puts result == "" ? "tree empty!!" : result
  when "pr"
    puts "preorder traversal"
    result = tree.preorder_traversal
    puts result == "" ? "tree empty!!" : result
  when "po"
    puts "postorder traversal"
    result = tree.postorder_traversal
    puts result == "" ? "tree empty!!" : result
  when "le"
    puts "levelorder traversal"
    result = tree.levelorder_traversal
    puts result == "" ? "tree empty!!" : result
  when "l"
    largest = tree.largest
    puts largest&.data ? "largest : #{largest&.data}" : "tree empty!!"
  when "s"
    smallest = tree.smallest
    puts smallest&.data ? "smallest : #{smallest&.data}" : "tree empty!!"
  when "f"
    puts "enter data to be searched"
    data = gets.chomp.to_i
    node = tree.find(data)
    puts node&.data ? "found!!" : "not found!!"
  when "d"
    puts "enter data to be deleted"
    data = gets.chomp.to_i
    puts tree.delete(data) ? "deleted" : "no such element"
  when "q"
    puts "do you want to store the tree in a output file? [y/n]"
    option = gets.chomp
    if option == "y"
      File.open("output.txt", "w") { |f| f.write tree.levelorder_traversal }
    end
  end
end