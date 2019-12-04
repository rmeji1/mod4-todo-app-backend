class ChangeColumnNameInItem < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :test, :text
  end
end
