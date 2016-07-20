require 'stock_picker'

describe "the stock_picker function" do
  it "solves a simple case correctly" do
    expect(stock_picker([1,4])).to eq([0,1])
  end

  it "solves a losing day correctly" do
    expect(stock_picker([5,4])).to eq([0,0])
  end

  it "returns a correct value" do
    expect(stock_picker([17,3,6,9,15,8,6,1,10])).to eq([1,4])
  end
end
