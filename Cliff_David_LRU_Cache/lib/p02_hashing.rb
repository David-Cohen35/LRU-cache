class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    hash_id = ''
    self.each do |ele|
      hash_num = ele.hash
      if hash_num >= 0
        strung = hash_num.to_s
      else
        strung = (-hash_num).to_s
      end
      hash_id += strung 
    end
    hash_id.to_i
  end
end

class String
  def hash
    hash_id = ''
    alpha = ('a'..'z').to_a
    self.each_char do |char|
      hash_char = alpha.index(char).hash
      if hash_char >= 0
        strung = hash_char.to_s
      else
        strung = (-hash_char).to_s
      end
      hash_id += strung 
    end
    hash_id.to_i
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    hash_id = 0
    self.each do |k, v|
      hash_key = k.hash
      hash_value = v.hash

      hash_id += hash_key + hash_value
    end
    hash_id
  end
end
