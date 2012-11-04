class AddHandsTable < ActiveRecord::Migration
  def change
    create_table :hands do |t|
      t.integer :game_player_id
      t.integer :card_one_id
      t.integer :card_two_id
      t.integer :card_three_id
      t.integer :card_four_id
      t.integer :card_five_id
      t.integer :card_six_id
      t.integer :trick_id
      t.integer :position

      t.timestamps
    end
  end
end
