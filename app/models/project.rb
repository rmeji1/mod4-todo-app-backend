class Project < ApplicationRecord
  belongs_to :user
  has_many :tasks
  has_many :notes
  has_and_belongs_to_many :tags
  
  def active_tasks 
    tasks.select do |task|
      task.is_completed == false 
    end
  end

  def completed_tasks 
    tasks.select do |task|
      task.is_completed
    end
  end
  
end
