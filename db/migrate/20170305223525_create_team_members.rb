class CreateTeamMembers < ActiveRecord::Migration
  def change
    create_table :team_members do |t|
      
      t.integer :team, index: true, foreign_key: true
      t.integer :user, index: true, foreign_key: true
      t.boolean :captain

      t.timestamps null: false
    end
  end
end
