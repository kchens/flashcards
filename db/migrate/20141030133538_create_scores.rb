class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.integer :point,default: 0
      t.belongs_to :user
    end
  end
end
