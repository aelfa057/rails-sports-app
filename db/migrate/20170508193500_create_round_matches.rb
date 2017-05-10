class CreateRoundMatches < ActiveRecord::Migration
  def change
    create_table :round_matches do |t|
      t.integer :round_id
      t.integer :match_id
      t.integer :winner_id
    end
  end
end
