require 'enumerable'

describe 'the my_each method' do
  arr = ['Alice', 'Bob', 'Carol']

  it 'returns self when not given a block' do
    expect(arr.my_each).to eq(arr)
  end

  b = Proc.new { |i| puts i }
  it 'returns a simple put block correctly' do
    # expect(arr.my_each(&b)).to output(output(arr.each(&b)).to_stdout).to_stdout
    expect(arr.my_each(&b)).to eq(arr.each(&b))
  end

  c = Proc.new { |i| i.size }
  it 'yields a size block correctly' do
    expect(arr.my_each(&c)).to eq(arr.each(&c))
  end
end
