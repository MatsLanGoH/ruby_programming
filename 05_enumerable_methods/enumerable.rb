# The Odin Project
# Ruby Programming Track - Project 5
# Enumerables: Recreate some Enumerables.

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
    # TODO: This line doesn't seem to return the same as
    # the internal select method. Why?
    return to_enum(:select) unless block_given?

    results = []
    my_each { |item| results << item if yield(item) }
    results
  end

  def my_all?
    # TODO: Implicitly use { |obj| obj } if no block given
    # How can I do this?
    if block_given?
      my_each { |item| return false unless yield(item) }
    else
      my_each { |item| return false unless item }
    end
    true
  end

  def my_any?
    # TODO: Implicitly use { |obj| obj } if no block given
    # How can I do this?
    if block_given?
      my_each { |item| return true if yield(item) }
    else
      my_each { |item| return true if item }
    end
    false
  end

  def my_none?
    if block_given?
      my_each { |item| return false if yield(item) }
    else
      my_each { |item| return false if item }
    end
    true
  end

  def my_count(arg = nil)
    # TODO: is there a better way to handle 0 or 1 arguments?
    count = 0
    if block_given?
      my_each { |item| count += 1 if yield(item) }
    elsif arg
      my_each { |item| count += 1 if item == arg }
    else
      count = length
    end
    count
  end

  def my_map
    result = []
    if block_given?
      my_each { |item| result << yield(item) }
    else
      # TODO: Same issue as with the my_select method.
      # This doesn't return the same thing as the builtin map method.
      result = enum_for(:map)
    end
    result
  end

  def my_inject(memo = nil, sym = nil)
    # TODO: Implement symbol
    if memo
      my_each { |item| memo = yield(memo, item) }
    else
      memo = first
      for item in self.drop(1)
        memo = yield(memo, item)
      end
    end
    memo
  end

  # Method to test my_inject
  def multiply_els(arr)
  end
end
