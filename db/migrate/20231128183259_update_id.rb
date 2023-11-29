class UpdateId < ActiveRecord::Migration[7.0]
  def change
    rename_column :Like, :id, :UserId
    rename_column :Post, :id, :AuthorId
  end
end
