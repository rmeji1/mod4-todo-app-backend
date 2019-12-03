class CreateJoinTableProjectsTags < ActiveRecord::Migration[6.0]
  def change
    create_join_table :projects, :tags, column_options: { null: false, foreign_key: true } do |t|
      t.index [:project_id, :tag_id]
      t.index [:tag_id, :project_id]
    end
  end
end
