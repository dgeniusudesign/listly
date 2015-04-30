class Services::AuthController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user
      if user.valid_password?(params[:password])
        sign_in user
        render json: {
          session: { id: user.id, name: user.name, email: user.email, token: user.auth_token }
        }, status: 200
      else
        render json: {
          error: {
            message: "wrong password"
          }
        }, status: 420
      end
    else
      render json: {
        error: {
          message: "user does not exist"
        }
      }, status: 420
    end
  end

  def destroy
    sign_out current_user
    render json: {}, status: 200
  end
end
