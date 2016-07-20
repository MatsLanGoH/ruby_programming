# The Odin Project
# Ruby Programming Track - Project 1
# Caesar Cipher
def encode(word, offset)
  output = ""
  word.each_char { |chr|
    if chr =~ /[ ,.!?'"]/
      output += chr
    elsif chr == chr.upcase
      output += (65 + ((chr.ord + offset - 65) % 26)).chr
    else
      output += (97 + ((chr.ord + offset - 97) % 26)).chr
    end
  }

  return output
end


puts "\nPlease enter the sentence you would like to encode."
sentence = gets.chomp

puts "\nPlease enter an offset."
offset = gets.chomp.to_i

puts encode(sentence, offset)
