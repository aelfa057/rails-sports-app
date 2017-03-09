class CreateMatches < ActiveRecord::Migration
  def change
    create_table :match_tables do |t|
      t.integer :sport_id
      t.string :created_by
      t.date :match_date
      t.time :match_time
      t.string :location
    end
  end
end
