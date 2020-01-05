class Api::V1::ResortsController < ApplicationController
  before_action :set_resort, only: [:show, :update, :mark_deleted]

  def index
    @resorts = Resort.all
    render json: { resorts: @resorts }, except: [:id, :created_at, :updated_at]
  end

  def show
    render json: @resort
  end

  def create
    @resort = Resort.new(resort_params)
    if @resort.save
      render json: @resort.as_json, status: :created
    else
      render json: {resort: @resort.errors, status: :no_content}
    end
  end

  # Set a :deleted attribute value to 'true' instead of real destroy of a resort record
  #
  def mark_deleted
    p "to be deleted: @resort = #{@resort}"
    if @resort.deleted
      p "Already deleted"

      render json: {
        deleted_resort: [],
        deleted_already: :not_modified,
      }
    else
      p "Yet NOT deleted"
      @resort.delete_resort

      render json: {
        deleted_resort: @resort,
        code: 200,
        status: :success,
      }, except: [:created_at, :updated_at]
    end
  end

  def update
    if @resort.update(resort_params)
      render json: @resort
    else
      render json: @resort.errors, status: :unprocessable_entity
    end
  end

  private

  def set_resort
    @resort = Resort.find(params[:id])
  end

  def resort_params
    params.permit(:name, :email, :description)
  end
end
