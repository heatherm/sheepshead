class AddPickerPartnerToGamePlayers < ActiveRecord::Migration
  def change
    add_column :game_players, :picker, :boolean
    add_column :game_players, :partner, :boolean
  end
end
