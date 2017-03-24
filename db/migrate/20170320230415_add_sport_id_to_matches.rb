class AddSportIdToMatches < ActiveRecord::Migration
  def change
    add_reference :matches, :sport, index: :true
  end
end
