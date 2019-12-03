class TaskSerializer < ActiveModel::Serializer
  attributes :id, :project_id,:is_completed, :title, :deadline
end
