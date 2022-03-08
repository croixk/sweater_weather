class Api::V1::BackgroundsController < ApplicationController

  def show
      data = BackgroundsFacade.get_image(params[:location])
      render json: BackgroundsSerializer.background(data)
  end
end
