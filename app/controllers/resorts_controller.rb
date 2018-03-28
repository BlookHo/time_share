class ResortsController < ApplicationController
  def index
    render json: Resort.all
  end

  def show
    render json: Resort.find(params[:id])
  end
end
