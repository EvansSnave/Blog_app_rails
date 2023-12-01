class AddReferences < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :User, :Like, column: :PostsCounter
    add_foreign_key :User, :Like, column: :PostsCounter
  end
end
