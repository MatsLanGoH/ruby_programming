# The Odin Project
# Warmup Exercise for Ruby Programming Track
# Input Word Counter

puts "Please enter a sentence:"
input = gets.chomp
words = input.split()

frequencies = Hash.new(0)

words.each { |word|
  # Remove punctuation marks
  if word[-1] =~ /[,.?!]/
    word = word[0..-2]
  end
  if word.length > 0
    frequencies[word] += 1
  end
}

frequencies = frequencies.sort_by { |a, b| b }
frequencies.reverse!
frequencies.each {
  |word, frequency| puts word + " " + frequency.to_s
}
