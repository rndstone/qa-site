class AddIsOpenToQuestion < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :is_open, :boolean
  end
end
