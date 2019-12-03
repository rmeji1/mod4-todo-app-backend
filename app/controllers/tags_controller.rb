class TagsController < ApplicationController
  def index
    return render json: Tag.all if !params.include?(:project_id)
    project = Project.find(params.require(:project_id))
    render json: project.tags
  end

  def create 
    if params.include?(:project_id) 
      project = Project.find(params.require(:project_id)) 
      tag = Tag.find_by(tag_params)
      if tag != nil
        project.tags << tag
      else
        tag = Tag.create(tag_params)
        project.tags << tag
      end
      render json: tag
    else
      tag = Tag.create(tag_params)
      render json: tag
    end
  end

  def show
    user = User.find(params.require(:user_id))
    tag = Tag.find(params.require(:id))
    render json: user.project_with_tag(tag)
  end

  private 
  def tag_params
    params.require(:tag).permit(:text)
  end
end
