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
    unless subtree_root&.data
      return nil
    end
    node = subtree_root
    while node.left
      node = node.left
    end
    return node
  end

  def inorder_traversal(subtree_root = @root)
    if subtree_root&.data
      return (
        inorder_traversal(subtree_root.left) +
        "#{subtree_root.data}," +
        inorder_traversal(subtree_root.right)
      )
    else
      return ""
    end
  end

  def postorder_traversal(subtree_root = @root)
    if subtree_root&.data
      return (
        postorder_traversal(subtree_root.left) +
        postorder_traversal(subtree_root.right) +
        "#{subtree_root.data},"
      )
    else
      return ""
    end
  end

  def preorder_traversal(subtree_root = @root)
    if subtree_root&.data
      return (
        "#{subtree_root.data}," +
        preorder_traversal(subtree_root.left) +
        preorder_traversal(subtree_root.right)
      )
    else
      return ""
    end
  end

  def levelorder_traversal
    result = ""
    node = @root
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

  def find(data)
    node = @root
    while node&.data
      if data > node&.data
        node = node.right
      elsif data < node&.data
        node = node.left
      else
        return node
      end
    end
    return node
  end

  def delete(data)
    @root = BST._delete(data, @root)
  end

  private

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
