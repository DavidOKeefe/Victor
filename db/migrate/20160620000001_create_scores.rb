class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.integer :player_id
      t.integer :round_id
      t.integer :scores

      t.timestamps null: false
    end
  end
end
