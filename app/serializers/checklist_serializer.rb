class ChecklistSerializer < ActiveModel::Serializer
  attributes :id, :title, :items

  def items 
    self.object.items.map do |item|
      ItemSerializer.new(item)
    end
  end
end
