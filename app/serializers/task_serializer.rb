class TaskSerializer < ActiveModel::Serializer
  attributes :id, :is_completed, :title, :deadline
end
