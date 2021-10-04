class Map

  def initialize
    @map = Array.new {Array.new}
  end

  def set(key, value)
    i = 0
    while i < @map.size
      if @map[i][0] == key
        @map[i][1] = value
        return @map
      end
      i += 1
    end
    @map.push [key, value]
  end

  def get(key)
    i = 0
    while i < @map.size
      if @map[i][0] == key
        return @map[i]
      end
      i += 1
    end
  end

  def delete(key)
    i = 0
    while i < @map.size
      if @map[i][0] == key
        @map.delete_at(i)
      end
      i += 1
    end
  end

  def show
    i = 0
    while i < @map.size
      print @map[i]
      puts ''
      i += 1
    end
  end

end

my_map = Map.new
my_map.set('a', 1)
my_map.set('b', 2)
my_map.set('c', 3)
my_map.set('b', 99)
my_map.get('b')
my_map.delete('c')
my_map.show