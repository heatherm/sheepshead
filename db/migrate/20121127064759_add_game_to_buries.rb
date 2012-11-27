class AddGameToBuries < ActiveRecord::Migration
  def change
    add_column :buries, :game_id, :integer
  end
end
