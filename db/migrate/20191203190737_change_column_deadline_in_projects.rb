class ChangeColumnDeadlineInProjects < ActiveRecord::Migration[6.0]
  def change
    change_column :projects, :deadline, :string
  end
end
