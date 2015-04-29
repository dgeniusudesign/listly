class HomeController < ApplicationController

  before_action :authenticate_user!

  def index
    @lists = current_user.lists
    @shared_lists = current_user.share_lists
  end
end
