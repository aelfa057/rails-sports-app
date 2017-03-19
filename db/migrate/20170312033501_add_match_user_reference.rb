class AddMatchUserReference < ActiveRecord::Migration
  def change
    
    remove_column :matches, :created_by
    add_column :matches, :user_id, :integer, index: true, foreign_key: true
    
  end
end
