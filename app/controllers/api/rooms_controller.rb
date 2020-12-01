class Api::RoomsController < ApplicationController
  before_action :set_room, only: [:show, :update, :destroy]
  before_action :authenticate_user!, only: [:create, :update, :destroy]
  before_action :is_admin

  # GET /rooms
  def index
    @rooms = Room.all

    render json: @rooms
  end

  # GET /rooms/1
  def show
    render json: @room
  end

  # POST /rooms
  def create
    @room = Room.new(room_params)

    if @room.save
      render json: @room, status: :created, location: @api_room
    else
      render json: @room.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /rooms/1
  def update
    if @room.update(room_params)
      render json: @room
    else
      render json: @room.errors, status: :unprocessable_entity
    end
  end

  # DELETE /rooms/1
  def destroy
    @room.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def room_params
      params.require(:room).permit(:name)
    end

    def is_admin
      if current_user.role.name == "admin"
        return true
      else
        render json: "you do not have the right to access this path", status: :unauthorized
      end
    end
end
