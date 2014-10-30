class CreateDecks < ActiveRecord::Migration
  def change
    create_table :decks  do |t|
      t.string :name
      t.integer :num_cards ,default: 4
    end
  end
end
