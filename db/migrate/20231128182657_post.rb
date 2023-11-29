class Post < ActiveRecord::Migration[7.0]
  def change
    create_table :Post do |t|
      t.string :Title
      t.string :Text
      t.integer :CommentsCounter
      t.integer :LikesCounter

      t.timestamps
    end
  end
end
