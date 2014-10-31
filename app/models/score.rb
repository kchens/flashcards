class Score < ActiveRecord::Base.connection_pool.with_connection do
  belongs_to :user
end
end
