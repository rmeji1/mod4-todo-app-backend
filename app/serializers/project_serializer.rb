class ProjectSerializer < ActiveModel::Serializer
  attributes :name, :description, :deadline, :is_completed, :priority, :is_deleted, :tasks
end
