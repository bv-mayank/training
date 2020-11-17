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
    BST._largest(@root)
  end

  def smallest
    BST._smallest(@root)
  end

  def inorder_traversal
    BST._inorder_traversal(@root)
  end

  def postorder_traversal
    BST._postorder_traversal(@root)
  end

  def preorder_traversal
    BST._preorder_traversal(@root)
  end

  def find(data)
    BST._find(data, @root)
  end

  def delete(data)
    @root = BST._delete(data, @root)
  end

  def self._insert(data,node)
    return BSTNode.new(data) unless node
    if data > node.data
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
    if node
      BST._inorder_traversal(node.left)
      puts "#{node.data} "
      BST._inorder_traversal(node.right)
    end
  end

  def self._preorder_traversal(node)
    if node
      puts "#{node.data} "
      BST._inorder_traversal(node.left)
      BST._inorder_traversal(node.right)
    end
  end

  def self._postorder_traversal(node)
    if node
      BST._inorder_traversal(node.left)
      BST._inorder_traversal(node.right)
      puts "#{node.data} "
    end
  end

  def self._largest(node)
    return nil unless node
    return node unless node.right
    BST._largest(node.right)
  end

  def self._find(data, node)
    return nil unless node && node.data
    return node if node.data == data
    if data > node.data
      BST._find(data, node.right)
    elsif
      BST._find(data, node.left)
    end
    return nil
  end

  def self._smallest(node)
    return nil unless node
    return node unless node.left
    BST._smallest(node.left)
  end

  def self._delete_smallest(node)
    return nil unless node
    if node.left == BST._smallest(node)
      node.left = node.left.right
    else
      BST._delete_smallest(node.left)
    end
  end

  def self._delete(data, node)
    return nil unless node

    if node.data < data
      node.right = BST._delete(data, node.right)
    elsif node.data > data
      node.left = BST._delete(data, node.left)
    else
      return node.left unless node.right
      return node.right unless node.left

      target = node
      node = _smallest(target.right)
      node.right = target.right
      BST._delete_smallest(target.right)
      node.left = target.left
    end
  end
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
    tree.inorder_traversal
  when "pr"
    puts "preorder traversal"
    tree.preorder_traversal
  when "po"
    puts "postorder traversal"
    tree.postorder_traversal
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