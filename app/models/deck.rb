class Deck < ActiveRecord::Base.connection_pool.with_connection do
  has_many :cards
end
end
