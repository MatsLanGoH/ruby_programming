require 'bubble_sort'

describe 'the bubble_sort function' do
  it 'returns a sorted array correctly' do
    arr = [1, 3, 4, 5]
    expect(bubble_sort(arr)).to eq(arr.sort)
  end

  it 'returns an almost sorted array correctly' do
    arr = [1, 3, 5, 4]
    expect(bubble_sort(arr)).to eq(arr.sort)
  end

  it 'returns an almost sorted array correctly' do
    arr = [1, 3, 5, 4, 2, 1]
    expect(bubble_sort(arr)).to eq(arr.sort)
  end


  it 'sorts an array correctly' do
    arr = [4, 3, 78, 2, 0, 2]
    expect(bubble_sort(arr)).to eq(arr.sort)
  end
end
