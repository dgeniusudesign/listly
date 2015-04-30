class Services::ListsController < ApplicationController

  before_action :set_user

  def index
    lists = @user.lists.all
    render json: lists, status: 200
  end

  def create
    list = List.new(user: @user, name: params[:name])
    if list.save
      render json: list, status: 201
    else
      render json: { errors: list.errors.as_json }, status: 420
    end
  end

  def show
    list = @user.lists.find_by(id: params[:id])
    if list
      render json: list, status: 200
    else
      render json: { error: "list not found" }, status: 420
    end
  end

  private
  def set_user
    @user = User.find_by_auth_token(params[:auth_token])
    render json: { error: "unauthenticated user" }, status: 420 unless @user
  end
end
