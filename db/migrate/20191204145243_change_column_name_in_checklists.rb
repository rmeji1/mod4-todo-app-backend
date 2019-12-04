class ChangeColumnNameInChecklists < ActiveRecord::Migration[6.0]
  def change
    rename_column :checklists, :name, :title
  end
end
