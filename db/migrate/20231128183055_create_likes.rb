class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :Like do |t|
      t.integer :PostId

      t.timestamps
    end
  end
end
