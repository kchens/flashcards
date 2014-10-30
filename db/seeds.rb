array=["Git","Ruby","Active Records","Rails","Sublime"]

array.each do |subject|
  Deck.create(name: subject)
end


