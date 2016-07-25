require 'enumerable'

# Test arrays
arr = ['Alice', 'Bob', 'Carol']
brr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16]


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

  xit 'returns self when not given a block' do
    expect(brr.my_select).to eq(brr.select)
  end

  it 'returns the correct object when given a block' do
    expect(brr.my_select(&e)).to eq(brr.select(&e))
  end


end


