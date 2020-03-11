class Api::ContactsController < ApplicationController
  def index
    @contacts = Contact.all
    render "index.json.jb"
  end

  def show
    @contact = Contact.find_by(id: params[:id])
    render "show.json.jb"
  end

  def create
    @contact = Contact.create(
      first_name: params[:first_name], 
      last_name: params[:last_name],
      phone_number: params[:phone_number],
      email: params[:email]
    )
    render "show.json.jb"
  end

  def update
    @contact = Contact.find_by(id: params[:id])
    @contact.update(
      first_name: params[:first_name] || @contact.first_name,
      middle_name: params[:middle_name] || @contact.middle_name,
      last_name: params[:last_name] || @contact.last_name,
      phone_number: params[:phone_number] || @contact.phone_number,
      email: params[:email] || @contact.email,
      bio: params[:bio] || @contact.bio
    )
    render "show.json.jb"
  end

  def destroy
    @contact = Contact.find_by(id: params[:id])
    @contact.destroy
    render json: {message: "Contact deleted"}    
  end
end
