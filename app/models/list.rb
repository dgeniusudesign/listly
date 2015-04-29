class List < ActiveRecord::Base

  has_many :items, dependent: :delete_all
  has_many :comments, dependent: :delete_all
  has_many :list_authorizations, foreign_key: 'share_list_id'
  has_many :share_users, class_name: "User", through: :list_authorizations

  belongs_to :user

  validates :name, presence: true
end
