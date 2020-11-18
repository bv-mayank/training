require_relative "LL"

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
    if @root&.data
      node = @root
      while node.data
        if data > node.data
          if node.right
            node = node.right
          else
            node.right = BSTNode.new(data)
            break
          end
        elsif node.left
          node = node.left
        else
          node.left = BSTNode.new(data)
          break
        end
      end
    else
      @root = BSTNode.new(data)
    end
  end

  def largest
    unless @root&.data
      return nil
    end
    node = @root
    while node.right
      node = node.right
    end
    return node
  end

  def smallest(subtree_root = @root)
    unless @root&.data
      return nil
    end
    node = subtree_root
    while node.left
      node = node.left
    end
    return node
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

  def levelorder_traversal
    unless @root&.data
      return "tree empty!!"
    end
    return BST._levelorder_traversal(@root)
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

  def self._levelorder_traversal(node)
    result = ""
    if node&.data
      queue = LL.new()
      queue.insert_last(node)
      queue_node = queue.delete_first
      while queue_node&.data
        result = result + "#{queue_node.data.data},"
        queue.insert_last(queue_node.data.left)
        queue.insert_last(queue_node.data.right)
        queue_node = queue.delete_first
      end
    end
    return result
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

  def self._find(data, node)
    return nil unless node && node.data
    return node if node.data == data
    if data > node.data
      BST._find(data, node.right)
    else
      BST._find(data, node.left)
    end
  end

  def self._delete_smallest(node)
    return nil unless node
    if node.left == smallest(node)
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
      node = smallest(target.right)
      node.right = target.right
      BST._delete_smallest(target.right)
      node.left = target.left
    end
    return node
  end
end
