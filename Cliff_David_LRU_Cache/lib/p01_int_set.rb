class MaxIntSet

  attr_reader :store

  def initialize(max)
    @max = max
    @store = Array.new(max + 1, false) 
    @min = 0
  end

  def insert(num)
    if num <= @max && num >= 0
      @store[num] = true
    else
      raise 'Out of bounds'
    end
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num] == true
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    i = num % num_buckets
    @store[i] << num
  end

  def remove(num)
    bucket = num % num_buckets
    @store[bucket].delete(num)
  end

  def include?(num)
    i = num % num_buckets
    @store[i].include?(num)
  end

  private

  # def [](num)
  #   @store[num]
  #   # optional but useful; return the bucket corresponding to `num`
  # end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    i = num % num_buckets
    # resize!
    unless @store[i].include?(num) #&& @count <= num_buckets
      @store[i] << num 
      @count += 1
    # else
    #   resize!
    end

    resize! if @count >= num_buckets
  end

  def remove(num)
    i = num % num_buckets
    if @store[i].include?(num)
      @store[i].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    i = num % num_buckets
    @store[i].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the  bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    holding_array = @store
    @store = Array.new(num_buckets * 2) {Array.new}
    holding_array.each do |row|
      row.each do |ele|
        self.insert(ele)
        @count -= 1
      end
    end
  end
end
