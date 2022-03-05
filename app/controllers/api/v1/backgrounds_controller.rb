class Api::V1::BackgroundsController < ApplicationController
  def show
    data = BackgroundsFacade.get_image(params[:query])
    render json: BackgroundsSerializer.image(data)
  end
end
