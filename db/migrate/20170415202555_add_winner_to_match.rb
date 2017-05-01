class AddWinnerToMatch < ActiveRecord::Migration
  def change
    add_reference :matches, :winner, references: :teams, index: true
    add_foreign_key :matches, :teams, column: :winner
  end
end
