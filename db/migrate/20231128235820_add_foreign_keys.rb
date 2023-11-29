class AddForeignKeys < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :Comment, :User, column: :UserId
  end
end
