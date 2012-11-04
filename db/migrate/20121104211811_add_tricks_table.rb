class AddTricksTable < ActiveRecord::Migration
  def change
    create_table :tricks do |t|
      t.integer :game_id
      t.integer :winner_id
      t.integer :play_one
      t.integer :play_two
      t.integer :play_three
      t.integer :play_four
      t.integer :play_five

      t.timestamps
    end
  end
end
