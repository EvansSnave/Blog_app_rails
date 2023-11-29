class AddIndex < ActiveRecord::Migration[7.0]
  def change
    add_index :Comment, :UserId, unique: true
    add_index :Post, :AuthorId, unique: true
    add_index :Like, :UserId, unique: true
    add_index :Like, :PostId, unique: true
  end
end
