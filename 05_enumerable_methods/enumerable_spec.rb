require 'enumerable'

# Test arrays
arr = ['Alice', 'Bob', 'Carol']
brr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16]
crr = ['ant', 'bear', 'cat']
drr = [1, 2, 3, nil]

# Test series my_each
describe 'the my_each method' do

  # Test blocks
  b = Proc.new { |i| puts i }
  c = Proc.new { |i| i.size }

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
  d = Proc.new { |val, idx| puts "Index: #{idx}, Value: #{val}" }

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
  e = Proc.new { |n| n%2 == 0 }
  f = Proc.new { |n| n.odd? }

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
  g = Proc.new { |word| word.length >= 3 }
  f = Proc.new { |word| word.length >= 4 }

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
