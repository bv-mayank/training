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
    unless @root&.data
      puts "tree empty!!"
      return
    end
    return BST._largest(@root)
  end

  def smallest
    unless @root&.data
      puts "tree empty!!"
      return
    end
    return BST._smallest(@root)
  end

  def inorder_traversal
    unless @root&.data
      return "tree empty!!"
    end
    return BST._inorder_traversal(@root)
  end

  def postorder_traversal
    unless @root&.data
      return "tree empty!!"
    end
    return BST._postorder_traversal(@root)
  end

  def preorder_traversal
    unless @root&.data
      return "tree empty!!"
    end
    return BST._preorder_traversal(@root)
  end

  def find(data)
    node = BST._find(data, @root)
    if node
      puts "found!!"
    else
      puts "not found!!"
    end
  end

  def delete(data)
    @root = BST._delete(data, @root)
  end

  private

  def self._insert(data, node)
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
    if node&.data
      return (
        BST._inorder_traversal(node.left) +
        "#{node.data}," +
        BST._inorder_traversal(node.right)
      )
    else
      return ""
    end
  end

  def self._preorder_traversal(node)
    if node&.data
      return (
        "#{node.data}," +
        BST._preorder_traversal(node.left) +
        BST._preorder_traversal(node.right)
      )
    else
      return ""
    end
  end

  def self._postorder_traversal(node)
    if node&.data
      return (
        BST._postorder_traversal(node.left) +
        BST._postorder_traversal(node.right) +
        "#{node.data},"
      )
    else
      return ""
    end
  end

  def self._largest(node)
    return nil unless node
    return node unless node.right
    return BST._largest(node.right)
  end

  def self._find(data, node)
    return nil unless node && node.data
    return node if node.data == data
    if data > node.data
      BST._find(data, node.right)
    else
      BST._find(data, node.left)
    end
  end

  def self._smallest(node)
    return nil unless node
    return node unless node.left
    return BST._smallest(node.left)
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
    return node
  end
end
