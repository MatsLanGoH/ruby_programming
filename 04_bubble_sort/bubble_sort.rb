# The Odin Project
# Ruby Programming Track - Project 4
# Bubble Sort

def bubble_sort(arr)
  loop do
    has_swapped = false
    arr[0..-2].each_with_index do |_, idx|
      if arr[idx] > arr[idx + 1]
        tmp = arr[idx]
        arr[idx] = arr[idx + 1]
        arr[idx + 1] = tmp
        has_swapped = true
      end
    end

    if !has_swapped
      break
    end
  end
  arr
end
