require_relative "Node"
require_relative "LL"

class BST
  def initialize
    @root = Node.new(nil)
  end

  def insert(data)
    if @root&.data
      node = @root
      while node.data
        if data > node.data
          if node.right
            node = node.right
          else
            node.right = Node.new(data)
            break
          end
        elsif node.left
          node = node.left
        else
          node.left = Node.new(data)
          break
        end
      end
    else
      @root = Node.new(data)
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
    node = @root
    parent_node = nil
    l_or_r = ""
    while node&.data
      if data > node&.data
        parent_node = node
        l_or_r = "r"
        node = node.right
      elsif data < node&.data
        parent_node = node
        l_or_r = "l"
        node = node.left
      else
        break
      end
    end
    if node&.data
      if node.right && node.left
        target_node = node
        node = smallest(target_node.right)
        node.right = target_node.right
        node.left = target_node.left
        BST._delete_smallest(target_node.right)
      else
        target_node = node.right || node.left
        case l_or_r
        when "l"
        parent_node.left = target_node
        when "r"
        parent_node.right = target_node
        when ""
          @root = Node.new(nil)
        end
      end
      return true
    else
      return false
    end
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
end
