class AddGames < ActiveRecord::Migration
  def change
      create_table :games do |t|
        t.int :player_id
        t.string :title
        t.text :content

        t.timestamps
      end
    end
end
