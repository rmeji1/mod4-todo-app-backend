class ItemSerializer < ActiveModel::Serializer
  attributes :id, :text, :is_completed
end
