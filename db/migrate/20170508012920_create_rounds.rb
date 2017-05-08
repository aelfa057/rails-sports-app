class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.integer :tournament_id
      t.integer :round_number
      t.integer :teams_count
      t.timestamps null: false
    end
  end
end
