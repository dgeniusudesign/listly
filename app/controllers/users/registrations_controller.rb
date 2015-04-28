class Users::RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
    super
    resource.is_password_set = true
    resource.save
  end

  def update
    super
  end
end
