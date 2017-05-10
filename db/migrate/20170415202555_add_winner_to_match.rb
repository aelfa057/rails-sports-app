class AddWinnerToMatch < ActiveRecord::Migration
  def change
    add_reference :matches, :winner, references: :teams, index: true
  end
end
