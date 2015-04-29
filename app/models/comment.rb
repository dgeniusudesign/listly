class Comment < ActiveRecord::Base
  belongs_to :list
  belongs_to :user

  validates_presence_of :content
  validates_presence_of :list
  validates_presence_of :user

end
