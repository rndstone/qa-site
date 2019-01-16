class AddImageNameToUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :image_name, :string
  end
end
