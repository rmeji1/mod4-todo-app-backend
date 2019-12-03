class TagsController < ApplicationController
  def index
    return render json: Tag.all if !params.include?(:project_id)
    project = Project.find(params.require(:project_id))
    render json: project.tags
  end

  def create 
    project_id = params.require(:project_id) 
    tag = Tag.create(tag_params.merge({project_id: project_id}))
    if tag.valid?
      render json: tag
    else
      render json: {error: "Error creating tag"}, status: 500
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
