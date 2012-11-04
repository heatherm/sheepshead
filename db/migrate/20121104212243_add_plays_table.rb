class AddPlaysTable < ActiveRecord::Migration
  def change
    create_table :plays do |t|
      t.integer :trick_id
      t.integer :game_player_id
      t.integer :card_id

      t.timestamps
    end
  end
end
