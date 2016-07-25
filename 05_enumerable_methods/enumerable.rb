# The Odin Project
# Ruby Programming Track - Project 5
# Enumerables: Recreate the .each generator.

module Enumerable
  def my_each
    return self unless block_given?

    for item in self
      yield(item)
    end
  end

  def my_each_with_index
    return self unless block_given?

    for i in 0...length
      # print "idx #{i}, val #{self[i]} | "
      yield(self[i], i)
    end
    self
  end


  def my_select
  end

  def my_all?
  end

  def my_any?
  end

  def my_none?
  end

  def my_count
  end

  def my_map
  end

  def my_inject
  end

end


# Method to test my_inject
def multiply_els(arr)

end
