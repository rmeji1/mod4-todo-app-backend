class TasksController < ApplicationController
  def index 
    project = Project.find(params.require(:project_id))
    query = params.permit('q')[:q]
    case query
    when 'active' 
      render json: project.active_tasks
    when 'completed'
      render json: project.completed_tasks
    else 
      render json: project.tasks
    end
  end 

  def create
    project_id = params.require(:project_id)
    task = Task.create(task_params.merge({project_id: project_id}))
    if task.valid?
      render json: task
    else
      render json: {error: 'unable to make new task'}
    end
  end

  def show 
    begin
      task = Task.find(params.require(:id))
      render json: task
    rescue ActiveRecord::RecordNotFound => e 
      render json: {error: "no task found"}, status: 404
    end
  end

  private 
  def task_params 
    params.require(:task).permit(:title, :deadline)
  end
end
