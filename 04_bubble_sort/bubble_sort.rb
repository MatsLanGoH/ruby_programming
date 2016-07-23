# The Odin Project
# Ruby Programming Track - Project 4
# Bubble Sort

def bubble_sort(arr)
  loop do
    has_swapped = false
    arr[0..-2].each_with_index do |_, idx|
      if arr[idx] > arr[idx + 1]
        arr[idx], arr[idx + 1] = arr[idx + 1], arr[idx]
        has_swapped = true
      end
    end

    unless has_swapped
      break
    end
  end
  arr
end

def bubble_sort_by(arr)
  loop do
    has_swapped = false
    arr[0..-2].each_with_index do |_, idx|
      if yield(arr[idx], arr[idx + 1]) > 0
        arr[idx], arr[idx + 1] = arr[idx + 1], arr[idx]
        has_swapped = true
      end
    end

    unless has_swapped
      break
    end
  end
  arr
end
