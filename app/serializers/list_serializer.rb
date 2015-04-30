class ListSerializer < ActiveModel::Serializer
  attributes :id, :name, :items_count, :user_id
  has_many :items
end
