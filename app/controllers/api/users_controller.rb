class Api::UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      render json: { message: "Usuario generado", data: user }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end
  def user_params
    params.permit(:name, :email, :password, :password_confirmation, :address, :phone)
  end
end
