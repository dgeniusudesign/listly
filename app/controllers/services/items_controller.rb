class Services::ItemsController < ApplicationController

  before_action :set_user

  def index
    list = @user.lists.find_by_id(params[:list_id])
    if list
      items = list.items.all
      render json: items, status: 200
    else
      render json: { error: "list not found" }, status: 420
    end
  end

  def create
    item = Item.new(user: @user, name: params[:name], list_id: params[:list_id])
    if item.save
      render json: item, status: 201
    else
      render json: { errors: item.errors.as_json }, status: 420
    end
  end

  def show
    item = @user.items.find_by(id: params[:id])
    if item
      render json: item, status: 200
    else
      render json: { error: "item not found" }, status: 420
    end
  end

  private
  def set_user
    @user = User.find_by_auth_token(params[:auth_token])
    render json: { error: "unauthenticated user" }, status: 420 unless @user
  end
end
