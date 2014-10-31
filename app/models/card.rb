class Card < ActiveRecord::Base.connection_pool.with_connection do
  belongs_to :deck
end
end
