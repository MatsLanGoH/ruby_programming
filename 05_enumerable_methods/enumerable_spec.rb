require 'enumerable'

# Test arrays
arr = ['Alice', 'Bob', 'Carol']
brr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16]
crr = ['ant', 'bear', 'cat']
drr = [1, 2, 3, nil]
frr = [nil, false]
grr = [1, 2, 4, 2]
hrr = ['alpha', 'bacon', 'chunky']

# Test series my_each
describe 'the my_each method' do

  # Test blocks
  b = proc { |i| puts i }
  c = proc { |i| i.size }

  it 'returns self when not given a block' do
    expect(arr.my_each).to eq(arr)
  end

  it 'returns a simple put block correctly' do
    # expect(arr.my_each(&b)).to output(output(arr.each(&b)).to_stdout).to_stdout
    expect(arr.my_each(&b)).to eq(arr.each(&b))
  end

  it 'yields a size block correctly' do
    expect(arr.my_each(&c)).to eq(arr.each(&c))
  end
end


# Test series my_each_with_index`
describe 'the my_each_with_index method' do

  # Test blocks
  d = proc { |val, idx| puts "Index: #{idx}, Value: #{val}" }

  it 'returns self when not given a block' do
    expect(arr.my_each_with_index).to eq(arr)
  end

  it 'returns indices and values correctly' do
    expect(arr.my_each_with_index(&d)).to eq(arr.each_with_index(&d))
  end

end


# Test series my_select
describe 'the my_select method' do

  # Test blocks
  e = proc { |n| n%2 == 0 }
  f = proc { |n| n.odd? }

  xit 'returns self when not given a block' do
    expect(brr.my_select).to eq(brr.select)
  end

  it 'returns the correct object when given a block' do
    expect(brr.my_select(&e)).to eq(brr.select(&e))
  end

  it 'returns odd values correctly' do
    expect(brr.my_select(&f)).to eq(brr.select(&f))
  end

  it 'returns a Hash object correctly' do
    hash = {:a => 1, :b => 2}
    expect(brr.my_select(&f)).to eq(brr.select(&f))
  end
end


# Test series my_all?
describe 'the my_all? method' do

  # Test blocks
  g = proc { |word| word.length >= 3 }
  f = proc { |word| word.length >= 4 }

  it 'returns true if all collection members are truthy and no block is given' do
    expect(crr.my_all?).to eq(true)
  end

  it 'returns false if not all collection members are truthy and no block is given' do
    expect(drr.my_all?).to eq(false)
  end

  it 'returns true if all collection members fulfill the block condition' do
    expect(crr.my_all?(&g)).to eq(true)
  end

  it 'returns false if not all collection members fulfill the block condition' do
    expect(crr.my_all?(&f)).to eq(false)
  end

end


# Test series my_any?
describe 'the my_any? method' do

  # Test blocks
  g = proc { |word| word.length >= 3 }
  f = proc { |word| word.length >= 4 }
  h = proc { |word| word.length >= 10 }

  it 'returns true if all collection members are true' do
    expect(crr.my_any?).to eq(true)
  end

  it 'returns true if at least one collection member is true' do
    expect(drr.my_any?).to eq(true)
  end

  it 'returns false if no collection members are true' do
    expect(frr.my_any?).to eq(false)
  end

  it 'returns true if all collection members fulfill the block condition' do
    expect(crr.my_any?(&g)).to eq(true)
  end

  it 'returns true if any collection members fulfill the block condition' do
    expect(crr.my_any?(&f)).to eq(true)
  end

  it 'returns false if no collection members fulfill the block comdition' do
    expect(crr.my_any?(&h)).to eq(false)
  end

end


# Test series my_none?
describe 'the my_none? method' do

  # Test blocks
  f = proc { |word| word.length == 5 }
  g = proc { |word| word.length >= 4 }

  it 'returns true if none of the collection members are true' do
    expect(frr.my_none?).to eq(true)
  end

  it 'returns true for an empty array' do
    expect([].my_none?).to eq(true)
  end

  it 'returns false if any of the collection members are true' do
    expect(crr.my_none?).to eq(false)
  end

  it 'returns true if none if the collection members fulfill the block condition' do
    expect(crr.my_none?(&f)).to eq(true)
  end

  it 'returns false if any of the collection members fulfill the block condition' do
    expect(crr.my_none?(&g)).to eq(false)
  end
end


# Test series my_count
describe 'the my_count method' do

  # Test blocks

  ab = proc { |n| n.even? }

  # Tests
  it 'returns the correct number of items when called without block or argument' do
    expect(grr.my_count).to eq(4)
  end

  it 'returns the correct number of items for an empty array' do
    expect([].my_count).to eq(0)
  end

  it 'returns the correct number of items when called with an argument' do
    expect(grr.my_count(2)).to eq(2)
  end

  it 'returns the correct number of items when called with an argument' do
    expect(hrr.my_count('bacon')).to eq(1)
  end

  it 'returns the correct number of items when called with a block' do
    expect(grr.my_count(&ab)).to eq(3)
  end
end

# Test series my_map
describe 'the my_map method' do
  # Test blocks
  bb = proc { |i| i * i }
  bc = proc { 'cat' }

  # Tests
  xit 'returns an enumerator if no block is given' do
    expect((1..4).my_map).to eq((1..4).map)
  end

  it 'returns a new array where each element fulfils the block condition' do
    expect((1..4).my_map(&bb)).to eq((1..4).map(&bb))
  end

  it 'returns a new array correctly' do
    expect((1..4).map(&bc)).to eq((1..4).map(&bc))
  end
end

# Test series my_inject
describe 'the my_inject method' do
  # Test blocks
  cb = proc { |sum, n| sum + n }
  cc = proc { |product, n| product * n }
  cd = proc do |memo, word|
    memo.length > word.length ? memo : word
  end

  # Tests
  it 'correctly sums some numbers using a symbol' do
    expect((5..10).my_inject(:+)).to eq(45)
  end

  it 'correctly sums some numbers using a block' do
    expect((5..10).my_inject(&cb)).to eq(45)
  end

  it 'correctly sums some numbers using a symbol' do
    expect((5..10).my_inject(:*)).to eq(151_200)
  end

  it 'correctly multiplies some numbers using a block and inject' do
    expect((5..10).my_inject(1, &cc)).to eq(151_200)
  end

  it 'correctly finds the longest word in an array' do
    expect(hrr.my_inject(&cd)).to eq('chunky')
  end
end

# describe 'the n_inject method' do
#   it 'sums all numbers' do
#     items = (1..4)
#     result = items.n_reduce(0) do |accumulator, element|
#       accumulator + element
#     end
#     expect(result).to eq(10)
#   end

#   it 'returns the accumulator if no value was provided' do
#     items = []
#     result = items.n_reduce(50) do |accumulator, element|
#       accumulator + element
#     end
#     expect(result).to eq(50)
#   end

#   it 'operates the execution provided' do
#     items = (1..4)
#     result = items.n_inject(0, :+)
#     expect(result).to eq(10)
#   end

#   it 'fails if both a symbol and a block are provided' do
#     items = (1..4)
#     expect do
#       items.n_inject(0, :+) do |accumulator, element|
#         accumulator + element
#       end
#     end.to raise_error(ArgumentError, "you must provide either an operation symbol or a block, not both")
#   end

#   it 'fails if the operation provided is not a symbol' do
#     items = (1..4)
#     expect do
#       items.n_inject(0, '+')
#     end.to raise_error(ArgumentError, "the operation provided must be a symbol")
#   end

#   it 'executes the operation provided without an initial value' do
#     items = (1..4)
#     result = items.n_reduce(:+)
#     expect(result).to eq(10)
#   end

#   it 'executes the block provided without an initial value' do
#     items = (1..4)
#     result = items.n_reduce do |accumulator, element|
#       accumulator + element
#     end
#     expect(result).to eq(10)
#   end
