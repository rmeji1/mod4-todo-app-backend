class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :deadline, :is_completed, :priority, :is_deleted, :tasks

  def tasks
    self.object.tasks.map do |task|
      TaskSerializer.new(task)
    end
  end

end
