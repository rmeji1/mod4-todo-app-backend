class ChecklistsController < ApplicationController
  def index 
    task = Task.find(params.require(:task_id))
    render json: task.checklists
  end 

  def create
    task_id = params.require(:task_id)
    checklist = Checklist.create(checklist_params.merge({task_id: task_id}))
    if checklist.valid?
      render json: checklist
    else 
      render json: {error: "unable to create checklist"}, status: 500
    end
  end

  def show
    begin
      checklist = Checklist.find(params.require(:id))
      render json: checklist
    rescue ActiveRecord::RecordNotFound => e
      render json:{error: 'checklist not found'}
    end
  end

  def update 
    begin
      checklist = Checklist.find(params.require(:id))
      checklist.update(checklist_params)
      render json: checklist
    rescue ActiveRecord::RecordNotFound => e
      render json:{error: 'checklist not found'}, status: 500
    end
  end

  def destroy
    begin
      checklist = Checklist.find(params.require(:id)
      checklist.destroy
      render json: checklist
    rescue ActiveRecord::RecordNotFound => e
      render json:{error: 'checklist not found'}, status: 500
    end
  end


  private 
  def checklist_params
    params.require(:checklist).permit(:title)
  end
end
