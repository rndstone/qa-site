class AddisOpen < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :is_open, :integer, default: 1, null: false
  end
end
