require 'byebug'
FISH = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def sluggish_octopus(fish_arr)
  result = ""

  fish_arr.each do |fish|
    fish_arr.each do |comparison_fish|
      if fish < comparison_fish
        result = fish
      end
    end
  end

  result
end

def dominant_octopus(fish_arr)
  return fish_arr if fish_arr.length == 1
  mid = fish_arr.length / 2
  left = dominant_octopus(fish_arr[0...mid])
  right = dominant_octopus(fish_arr[mid..-1])
  merge(left, right)
end

def merge(left_arr, right_arr)
  result = []
  left = left_arr.dup
  right = right_arr.dup

  until left.empty? || right.empty?
    if left.first.length > right.first.length
      result << right.shift
    else
      result << left.shift
    end
  end

  result += left
  result + right
end

def dominant_octopus_answer
  dominant_octopus(FISH).last
end

def clever_octopus(fish_arr)
  result = ""

  fish_arr.each { |fish| result = fish if result.length < fish.length}

  result
end

def slow_dance(input, tiles_array)
  result = 0
  tiles_array.each_with_index do |tile, tenticle_idx|
    result = tenticle_idx if input == tile
    break
  end
  result
end

def constant_dance(input, tiles_array)
  hash = Hash.new
  tiles_array.each_with_index { |k,v| hash[k] = v }
  hash[input]
end
