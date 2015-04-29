class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  mount_uploader :avatar, AvatarUploader

  has_many :lists
  has_many :items
  has_many :authentications
  has_many :comments
  has_many :list_authorizations, foreign_key: 'share_user_id'
  has_many :share_lists, class_name: "List", through: :list_authorizations

  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

  def self.find_for_oauth(auth)
    registered_user = User.where(:email => auth.info.email).first
    if registered_user
      registered_user.update_attribute(:remote_avatar_url, auth.info.image.gsub('http://','https://'))
      return registered_user
    else
      user = User.new(name: auth.info.name, email: auth.info.email, password: Devise.friendly_token[0,20], remote_avatar_url: auth.info.image.gsub('http://','https://'))
      user.save
      return user
    end
  end

end
