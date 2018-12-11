class AddDefalutToCategoryIsOpen < ActiveRecord::Migration[5.0]
  def up
    change_column_default(:questions, :is_open, true)
  end
  # db:rollbackした時に実行される処理
  def down
    change_column_default(:questions, :is_open, nil)
  end
end
