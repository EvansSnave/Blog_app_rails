class ChangeName < ActiveRecord::Migration[7.0]
  def change
    rename_column :Comment, :postId, :PostId
    add_index :Comment, :PostId, unique: true
  end
end
