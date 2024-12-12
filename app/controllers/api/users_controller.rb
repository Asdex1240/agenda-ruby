class Api::UsersController < ApplicationController
  def show
    user = User.find params[:id]
    render json: user.as_json(include: :contacts)
  rescue
    render json: { errors: contact.errors.full_messages }, status: :unprocessable_entity
  end
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
