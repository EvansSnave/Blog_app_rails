class AddPostIdToComment < ActiveRecord::Migration[7.0]
  def change
    add_column :Comment, :postId, :integer
  end
end
