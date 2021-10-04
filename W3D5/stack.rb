class Stack
  
  def initialize
    @ivar = Array.new
  end

  def push(el)
    @ivar.unshift el
  end

  def pop
    @ivar.pop
  end

  def peek
    @ivar.first
  end

end

example = Stack.new
example.push(1)
example.push(2)
example.push(3)
example.pop
p example.peek