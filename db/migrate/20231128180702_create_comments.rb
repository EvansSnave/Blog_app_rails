class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :Comment do |t|
      t.string :text

      t.timestamps
    end
  end
end
