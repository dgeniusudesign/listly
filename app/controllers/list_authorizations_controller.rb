class ListAuthorizationsController < ApplicationController

  def create
    @share_user = User.find_by_email(params[:email])
    @list_auth = ListAuthorization.new(share_user: @share_user, share_list_id: params[:list_id])
    respond_to do |format|
      format.js
    end
  end

  def destroy
  end

end
