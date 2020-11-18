require_relative "BST"

tree = BST.new()
action = "h"

def print_help
  puts "\n" +
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
end

print_help
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
    puts tree.inorder_traversal
  when "pr"
    puts "preorder traversal"
    puts tree.preorder_traversal
  when "po"
    puts "postorder traversal"
    puts tree.postorder_traversal
  when "le"
    puts "levelorder traversal"
    puts tree.levelorder_traversal
  when "l"
    puts "largest"
    puts tree.largest.data
  when "s"
    puts "smallest"
    puts tree.smallest.data
  when "f"
    puts "enter data to be searched"
    data = gets.chomp.to_i
    tree.find(data)
  when "d"
    puts "enter data to be deleted"
    data = gets.chomp.to_i
    tree.delete(data)
  end
end