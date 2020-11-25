class WelcomeController < ApplicationController
  def index
    if params[:name]
      render json: { hello: params[:name] }
    else
      render json: {status: 'error', code: 422, message: 'No name param given'}
    end
  end
end
