class AddCardsTable < ActiveRecord::Migration
  def self.up
    create_table :cards do |t|
      t.string :suit
      t.string :rank
      t.integer :value
      t.boolean :trump
      t.integer :trump_rank
    end
  end

  def self.down
    drop_table :cards
  end
end
