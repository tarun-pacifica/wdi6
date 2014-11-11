# Hashtag Extractor
# Write a function that takes a string and returns an array of any hashtags it contains:

# get_tags("Some guy won't hire women because they get pregnant #rorosyd #smdh #misandry")

# => ['#rorosyd', '#smdh', '#misandry']

@regex = /#([A-Za-z0-9]+)/

test_string = "Some guy won't hire women because they get pregnant #rorosyd #smdh #misandry"

@empty_array = []

def hashtag(string)
  array = string.split(" ")
  array.each do |word|
    if word.match(@regex)
      @empty_array.push(word)
    end
  end
end

hashtag(test_string)

p @empty_array

