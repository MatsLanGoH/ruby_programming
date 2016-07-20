# The Odin Project
# Ruby Programming Track - Project 3
# Substrings

# Takes a sentence and a dictionary
# Returns a hash containing a frequency count of words
# from the dictionary contained in the sentence.
def substrings(input, dict)
  frequencies = Hash.new(0)

  input.split().each do |word|
    dict.each do | str |
      if word.downcase.include? str
        frequencies[str] += 1
      end
    end
  end
  return frequencies
end
