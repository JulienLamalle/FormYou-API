class FormationAttendancesController < ApplicationController
  before_action :set_formation_attendance, only: [:show, :update, :destroy]

  # GET /formation_attendances
  def index
    @formation_attendances = FormationAttendance.all

    render json: @formation_attendances
  end

  # GET /formation_attendances/1
  def show
    render json: @formation_attendance
  end

  # POST /formation_attendances
  def create
    @formation_attendance = FormationAttendance.new(formation_attendance_params)

    if @formation_attendance.save
      render json: @formation_attendance, status: :created, location: @formation_attendance
    else
      render json: @formation_attendance.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /formation_attendances/1
  def update
    if @formation_attendance.update(formation_attendance_params)
      render json: @formation_attendance
    else
      render json: @formation_attendance.errors, status: :unprocessable_entity
    end
  end

  # DELETE /formation_attendances/1
  def destroy
    @formation_attendance.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_formation_attendance
      @formation_attendance = FormationAttendance.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def formation_attendance_params
      params.require(:formation_attendance).permit(:user_id, :formation_id, :formation_session_id)
    end
end
