class AddCompletedToMatch < ActiveRecord::Migration
  def change
    add_column :matches, :completed, :boolean
  end
end
