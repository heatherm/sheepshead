class AddBuriesTable < ActiveRecord::Migration
  def change
    create_table :buries do |t|
      t.integer :card_one_id
      t.integer :card_two_id

      t.timestamps
    end
  end
end
