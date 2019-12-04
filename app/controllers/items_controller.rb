class ItemsController < ApplicationController
  def index 
    begin 
      checklist = Checklist.find(params.require(:checklist_id))
      render json: checklist.items
    rescue ActiveRecord::RecordNotFound => e
      render json: {error: 'Checklist or item not found.'}
    end
  end

  def create
    checklist_id = params.require(:checklist_id) ,,

    item = Item.create(item_params.merge({checklist_id: checklist_id}))
    render json: item
  end

  def update
    item = Item.find(params.require(:id))
    item.update(item_params)
    render json: item
  end
  private 
  def item_params
    params.require(:item).permit(:text, :is_completed)
  end
end
