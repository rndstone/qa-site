class AddImageName < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :image_name, :string, default: "default.jpg"
  end
end
