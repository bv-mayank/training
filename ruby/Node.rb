class Node
  attr_accessor :right, :left
  attr_reader :data

  def initialize(data)
    @data = data
    @right = nil
    @left = nil
  end
end