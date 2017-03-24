class RemoveSportIdFromMatches < ActiveRecord::Migration
  def change
    remove_column :matches, :sport_id
  end
end
