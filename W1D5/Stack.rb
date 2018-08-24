class Stack
  def initialize(array)
    @array = array
  end

  def push(el)
    @array.push(el)
    el
  end

  def pop
    @array.pop
  end

  def peek
    # returns, but doesn't remove, the top element in the stack
  end
end
