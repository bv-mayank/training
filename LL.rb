require_relative "Node"

class LL
  def initialize
    @root = Node.new(nil)
    @last = @root
  end

  def insert_last(data)
    unless data
      return
    end
    if @root&.data
			new_node = Node.new(data)
      @last.right = new_node
      new_node.left = @last
      @last = new_node
    else
      @root = Node.new(data)
      @last = @root
    end
  end

  def delete_first
    node = @root
    if @root&.right
      @root = @root.right
      @root.left = nil
    elsif @root&.data
      @root = Node.new(nil)
      @last = @root
    end
    return node
  end

  def delete(data)
    node = search(data)
    if node
        left_node = node&.left
      right_node = node&.right
      if left_node
        left_node.right = right_node
      end
      if right_node
        right_node.left = left_node
      end
    end
    return node
  end

  def print_list
    result = "list : "
    node = @root
    while node&.data&.data
      result = result + node&.data&.data.to_s + ","
      node = node.right
    end
    puts result
  end
	
	def search(data)
		node = @root
		until node && node&.data == data
			node = node.right
		end
		return node
  end
  
  def reverse_list
    node = @root
    while node
      old_right = node.right
      old_left = node.left
      node.right = old_left
      node.left = old_right
      node = old_right
    end
  end
end
