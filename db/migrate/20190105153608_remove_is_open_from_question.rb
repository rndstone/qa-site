class RemoveIsOpenFromQuestion < ActiveRecord::Migration[5.0]
  def change
    remove_column :questions, :is_open, :boolean
  end
end
