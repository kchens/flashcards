array=["Git","Ruby","Active Records","Rails","Sublime"]

# array.each do |subject|
#   Deck.create(name: subject)
# end

array.each do |subject|

  array = Deck.create(name: subject)

  CSV.foreach('db/#{subject}.csv') do |row|
    deck.cards.create(question: row[0] , answer: row[1] , id: row[2])
  end


end



