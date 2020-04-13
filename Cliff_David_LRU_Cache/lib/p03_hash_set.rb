class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    i = key.hash % num_buckets
    unless @store[i].include?(key.hash)
      @store[i] << key.hash
      @count += 1
    end
    resize! if @count == num_buckets
  end

  def include?(key)
    i = key.hash % num_buckets
    @store[i].include?(key.hash)
  end

  def remove(key)
    # return unless @store[i].include?(key.hash)
    i = key.hash % num_buckets
    if @store[i].include?(key.hash)
      @store[i].delete(key.hash) 
      @count -= 1
    end
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
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
