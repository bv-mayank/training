class BSTNode
  attr_accessor :left, :right
  attr_reader :data

  def initialize(data)
    @data = data
    @left = nil
    @right = nil
  end
end

class BST
  def initialize
    @root = BSTNode.new(nil)
  end

  def insert(data)
    if @root.data
      BST._insert(data, @root)
    else
      @root = BSTNode.new(data)
    end
  end

  def largest
    node = @root
    while node.right
      node = node.right
    end
    if (node.data)
      puts node.data
    else
      puts "tree empty!!"
    end
  end

  def smallest
    node = @root
    while node.left
      node = node.left
    end
    if (node.data)
      puts node.data
    else
      puts "tree empty!!"
    end
  end

  def inorder_traversal
    if @root.data
      BST._inorder_traversal(@root)
    else
      puts "tree empty!!"
    end
  end

  def preorder_traversal
    if @root.data
      BST._preorder_traversal(@root)
    else
      puts "tree empty!!"
    end
  end
  
  def preorder_traversal
    if @root.data
      BST._preorder_traversal(@root)
    else
      puts "tree empty!!"
    end
  end

  def find(data)
    if @root.data
      BST._find(data, @root)
    else
      puts "tree empty!!"
    end
  end

  def delete(data)

  
  private

  def self._insert(data, node)
    if node.data < data
      if node.right
        BST._insert(data, node.right)
      else
        node.right = BSTNode.new(data)
      end
    elsif node.left
        BST._insert(data, node.left)
    else
      node.left = BSTNode.new(data)
    end
  end

  def self._inorder_traversal(node)
    if node.left
      BST._inorder_traversal(node.left)
    end
    puts "#{node.data} "
    if node.right
      BST._inorder_traversal(node.right)
    end
  end

  def self._preorder_traversal(node)
    puts "#{node.data} "
    if node.left
      BST._preorder_traversal(node.left)
    end
    if node.right
      BST._preorder_traversal(node.right)
    end
  end

  def self._postorder_traversal(node)
    if node.left
      BST._postorder_traversal(node.left)
    end
    if node.right
      BST._postorder_traversal(node.right)
    end
    puts "#{node.data}"
  end

  def self._find(data, node)
    if node.value == value
      puts "found!!"
      return
    elsif value > node.value
      BST._find(data, node.right)
    else
      BST._find(data, node.left)
    end
    puts "not found!!"
  end

  def 
end

tree = BST.new()
action = "h"

def print_help
  puts "\n" +
    "i \tto insert\n" +
    "pr \tto print preorder traversal\n" +
    "in \tto print inorder traversal\n" +
    "po \tto print postorder traversal\n" +
    "l \tto print largest\n" +
    "s \tto print smallest\n" +
    "f \tto find an element\n" +
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
    tree.inorder_traversal
  when "pr"
    puts "preorder traversal"
    tree.preorder_traversal
  when "po"
    puts "postorder traversal"
    tree.postorder_traversal
  when "l"
    puts "largest"
    tree.largest
  when "s"
    puts "smallest"
    tree.smallest
  when "f"
    puts "enter data to be searched"
    data = gets.chomp.to_i
    tree.find(data)
  end
end