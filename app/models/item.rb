class Item < ActiveRecord::Base

  belongs_to :list, counter_cache: true
  belongs_to :user

  validates :name, presence: true
end
