class NotesController < ApplicationController
  def index 
    project = Project.find(params.require(:project_id))
    render json: project.notes
  end 

  def create 
    project_id = params.require(:project_id)
    note = Note.create(notes_params.merge({project_id: project_id}))
    render note
  end

  def destroy 
    note = Note.find(params.require(:id))
    note.destroy()
    render json: note
  end

  private 
  def notes_params
    params.require(:note).permit(:text)
  end
end
