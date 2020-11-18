class LLNode
  attr_accessor :next
  attr_reader :data

  def initialize(data)
    @data = data
    @next = nil
  end
end

class LL
  def initialize
    @root = LLNode.new(nil)
    @last = @root
  end

  def insert_last(data)
    unless data
      return
    end
    if @root&.data
      @last.next = LLNode.new(data)
      @last = @last.next
    else
      @root = LLNode.new(data)
      @last = @root
    end
  end

  def delete_first
    deleted_node = @root
    if @root&.next
      @root = @root.next
    elsif @root&.data
      @root = LLNode.new(nil)
      @last = @root
    end
    return deleted_node
  end

  def print_list
    result = "list : "
    node = @root
    while node&.data&.data
      result = result + node&.data&.data.to_s + ","
      node = node.next
    end
    puts result
  end
  private
end