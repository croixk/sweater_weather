class Api::V1::BackgroundsController < ApplicationController

  def show
      data = BackgroundsFacade.get_image(params[:location])
      if data[:photos] != []
        render json: BackgroundsSerializer.background(data)
      else
        render status: 404
      end
  end
end
