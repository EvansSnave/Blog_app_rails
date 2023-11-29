class UpdateName < ActiveRecord::Migration[7.0]
  def change
    rename_column :Comment, :id, :UserId
  end
end
