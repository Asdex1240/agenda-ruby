class Api::ContactsController < ApplicationController
  def create
    contact = Contact.new contact_params
    if contact.save
      render json: { message: "Contacto Agregado", data: contact }, status: :created
    else
      render json: { errors: contact.errors.full_messages }, status: :unprocessable_entity
    end
  end
  def show
    contact = Contact.find params[:id]
    render json: contact
  rescue ActiveRecord::RecordNotFound
    render json: { message: "Contacto no encontrado" }, status: :not_found
  end
  def update
    contact = Contact.find params[:id]
    if contact.nil?
      render json: { message: "Contacto no encontrado" }, status: :not_found
    elsif contact.update contact_params
      render json: { message: "Actualizado", data: contact }
    else
      render json: { message: contact.errors.full_messages }, status: :unprocessable_entity
    end
  end
  def destroy
    contact = Contact.find params[:id]
    if contact.nil?
      render json: { message: "Contacto no encontrado" }, status: :not_found
    else
      contact.destroy
      render json: { message: "Eliminado" }, status: :ok
    end
  end
  def contact_params
    params.require(:contact).permit :name, :phone, :address, :user_id
  end
end
