class Queue

  def initialize
    @ivar = Array.new
  end

  def enqueue(el)
    @ivar.unshift(el)
  end

  def dequeue
    @ivar.shift
  end

  def peek
    @ivar.first
  end

end

example = Queue.new
example.enqueue(1)
example.enqueue(2)
example.enqueue(3)
example.dequeue
p example.peek