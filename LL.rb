require_relative "Node"

class LL
  def initialize
    @first = Node.new(nil)
    @last = @first
  end

  def insert(data)
    unless data
      return
    end
    if @first&.data
			new_node = Node.new(data)
      @last.right = new_node
      new_node.left = @last
      @last = new_node
    else
      @first = Node.new(data)
      @last = @first
    end
  end

  def delete_first
    node = @first
    if @first&.right
      @first = @first.right
      @first.left = nil
    elsif @first&.data
      @first = Node.new(nil)
      @last = @first
    end
    return node
  end

  def delete(data)
    node = find(data)
    if node
      left_node = node&.left
      right_node = node&.right
      if !(left_node || right_node)
        @first = Node.new(nil)
        @last = @first
      else
        if left_node
          left_node.right = right_node
          if node == @last
            @last = left_node
          end
        end
        if right_node
          right_node.left = left_node
          if node == @first
            @first = right_node
          end
        end
      end
    end
    return node
  end

  def traverse
    result = ""
    node = @first
    while node&.data
      result = result + node&.data.to_s + ","
      node = node.right
    end
    return result
  end
	
	def find(data)
		node = @first
		while node && node&.data != data
			node = node&.right
		end
		return node
  end
  
  def reverse_list
    node = @first
    while node
      old_right = node.right
      old_left = node.left
      node.right = old_left
      node.left = old_right
      node = old_right
    end
    old_first = @first
    @first = @last
    @last = old_first
  end
end
