class Checklist < ApplicationRecord
  belongs_to :task
  has_many :items, dependent: :delete_all
end
