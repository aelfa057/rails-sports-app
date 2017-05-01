class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.references :match, foreign_key: true
      t.integer :winner_id_from_home
      t.integer :winner_id_from_away
      t.boolean :disputed
      t.references :winner, foreign_key: true
      t.timestamps null: false
    end
  end
end
