class ChangeMatchTimeToString < ActiveRecord::Migration
  def up
    change_column :matches, :match_time, :string
  end

  def down
    change_column :matches, :match_time, :time
  end
end


