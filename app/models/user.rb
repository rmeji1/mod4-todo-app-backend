class User < ApplicationRecord
  has_many :projects

  def active_projects 
    projects.select do |project| 
      project.is_completed == false 
    end
  end 

  def completed_projects 
    projects.select do |project| 
      project.is_completed == true 
    end
  end
  
  def projects_with_tag(tag)
    rojects.select do |project| 
      project.tags.include?(tag) 
    end
  end
end
