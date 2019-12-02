class NotesController < ApplicationController
  def index 
    project = Project.find(params.require(:project_id))
    render project.notes
  end 

  def create 

  end

  def destroy 

  end

  private 
  def notes_params

  end
end
