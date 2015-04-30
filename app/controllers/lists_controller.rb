class ListsController < ApplicationController

  before_action :authenticate_user!
  before_action :is_list_viewable, only: [:show, :edit, :cancel_edit, :update, :destroy]
  before_action :set_list, only: [:show, :edit, :cancel_edit, :update, :destroy]

  def show
    @items = @list.items.all
    @comments = @list.comments.all
  end

  # POST /lists
  # POST /lists.json
  def create
    @list = current_user.lists.new(list_params)

    respond_to do |format|
      if @list.save
        format.html { redirect_to @list, notice: 'List was successfully created.' }
        format.js
        format.json { render :show, status: :created, location: @list }
      else
        format.html { render :new }
        format.js
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    respond_to do |format|
      format.js
    end
  end

  def cancel_edit
    respond_to do |format|
      format.js
    end
  end

  # PATCH/PUT /lists/1
  # PATCH/PUT /lists/1.json
  def update
    respond_to do |format|
      if @list.update(list_params)
        @updated = true
      else
        @updated = false
      end
      format.js
    end
  end

  # DELETE /lists/1
  # DELETE /lists/1.json
  def destroy
    @list_id = @list.id
    respond_to do |format|
      format.js
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_list
    @list = List.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def list_params
    params.require(:list).permit(:name, :items_count)
  end
end
