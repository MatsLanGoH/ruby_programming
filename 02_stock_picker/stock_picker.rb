# The Odin Project
# Ruby Programming Track - Project 2
# Stock Picker

def stock_picker(arr)

  results = []

  cur_max, cur_min = 0, 0
  max_pos, min_pos = 0, 0
  best_difference = 0

  # Iterate over array in reverse
  arr.reverse_each { |x|

    # Check max/min values
    if x > cur_max
      cur_max = x
      cur_min = x
    elsif x < cur_min
      cur_min = x
    end

    # Update best_difference
    if cur_max - cur_min > best_difference
      best_difference = cur_max - cur_min
      max_pos = arr.index(cur_max)
      min_pos = arr.index(cur_min)
    end
  }

  # Return results as an array
  results.push(min_pos).push(max_pos)

end


