class FormationCategoriesController < ApplicationController
  before_action :set_formation_category, only: [:show, :update, :destroy]

  # GET /formation_categories
  def index
    @formation_categories = FormationCategory.all

    render json: @formation_categories
  end

  # GET /formation_categories/1
  def show
    render json: @formation_category
  end

  # POST /formation_categories
  def create
    @formation_category = FormationCategory.new(formation_category_params)

    if @formation_category.save
      render json: @formation_category, status: :created, location: @formation_category
    else
      render json: @formation_category.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /formation_categories/1
  def update
    if @formation_category.update(formation_category_params)
      render json: @formation_category
    else
      render json: @formation_category.errors, status: :unprocessable_entity
    end
  end

  # DELETE /formation_categories/1
  def destroy
    @formation_category.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_formation_category
      @formation_category = FormationCategory.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def formation_category_params
      params.require(:formation_category).permit(:formation_id, :category_id)
    end
end
