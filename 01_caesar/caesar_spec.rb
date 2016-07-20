require 'caesar'

describe "the encode function" do
  it "encodes a word correctly" do
    expect(encode("word", 1)).to eq("xpse")
  end

  it "skips spaces correctly" do
    expect(encode("hail caesar", 5)).to eq("mfnq hfjxfw")
  end

  it "wraps letters correctly" do
    expect(encode("wrap them all", 10)).to eq("gbkz drow kvv")
  end

  it "keeps cases correctly" do
    expect(encode("Thanks For All The Fish", 42)).to eq("Jxqdai Veh Qbb Jxu Vyix")
  end

  it "encodes a sentence correctly" do
    expect(encode("This is a great exercise!", 13)).to eq("Guvf vf n terng rkrepvfr!")
  end
end

