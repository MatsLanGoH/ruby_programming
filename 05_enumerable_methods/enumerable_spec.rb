require 'enumerable'

describe 'the my_each method' do
  arr = ['Alice', 'Bob', 'Carol']
  it 'returns self when not given a block' do
    expect(arr.my_each).to eq(arr)
  end
end
