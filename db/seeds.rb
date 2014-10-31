
require 'CSV'

array=["Git","Ruby","Active Records","Rails","Sublime"]


# array.each do |subject|
#   Deck.create(name: subject)
# end

array.each do |subject|

  deck = Deck.create(name: subject)


  CSV.foreach('db/' + subject + '.csv') do |row|

    deck.cards.create(question: row[0] , answer: row[1] , deck_id: row[2])
  end


end



