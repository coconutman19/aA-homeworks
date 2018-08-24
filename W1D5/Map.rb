class Map
  attr_reader :array

  def initialize
    @array = []
  end

  def set(key, value) #like hashes
    exist_location = nil
    @array.each_with_index { |el, idx| exist_location = idx if el.first == key}

    if exist_location
      @array[exist_location].last = value
    else
      @array.push([key, value])
    end

    value
  end

  def get(key)
    @arr.each do |key_pair|
      if key_pair[0] == key
        return key_pair[-1]
      end
    end

    nil
  end

  def delete(key)

  end

  def show

  end


end
