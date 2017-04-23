
module RandomData             #RandomData is a module because its a standalone library, no dependencies/inheritance
                              #the use of a module helps keep common functions organized and reusable 
  def self.random_paragraph   
    sentences = []            #We set sentences to an array. We create four to six random sentences and append them to sentences to create paragraph
    rand(4..6).times do
      sentences << random_sentence  
    end
    
    sentences.join("")
  end
  
  def self.random_sentence    #create sentences with random number of words (3 to 8).
    strings = []
    rand(3..8).times do
      strings << random_word
    end    
  
  sentence = strings.join(" ")
  sentence.capitalize << "."     #append period to end of sentence
  end
  
  def self.random_word
    letters = ("a".."z").to_a  #
    letters.shuffle!           #call shuffle on letters in place with "!", otherwise it would return an array
    letters[0,rand(3..8)].join #We  join the zeroth through nth item in letters. The nth item is the result of  rand(3..8) which returns a random number greater than or equal to three and less than eight.
  end
  
  def self.random_number
    rand 10
  end
end