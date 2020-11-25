class WelcomeController < ApplicationController
  def index
    if params[:name]
      render json: { hello: params[:name] }
    else
      render json: { status: 'error', code: 422, message: 'No name param given' }, status: :unprocessable_entity
    end
  end

  def reverse
    if params[:string]
      render json: { reversed_string: params[:string].chars.reverse.join('') }
    else
      render json: { status: 'error', code: 422, message: 'No string param given' }, status: :unprocessable_entity
    end
  end
end
