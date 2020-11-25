class WelcomeController < ApplicationController
  def index
    render json: { hello: params[:name] }
  end
end
