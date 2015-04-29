class List < ActiveRecord::Base
  has_many :items, dependent: :delete_all
  has_many :comments, dependent: :delete_all
  belongs_to :user

  validates :name, presence: true
end
