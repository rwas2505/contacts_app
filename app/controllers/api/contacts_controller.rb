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
    @contact = Contact.new(
      first_name: params[:first_name], 
      middle_name: params[:middle_name],
      last_name: params[:last_name],
      phone_number: params[:phone_number],
      email: params[:email],
      bio: params[:bio],
      latitude: Geocoder.coordinates(params[:address])[0],
      longitude:Geocoder.coordinates(params[:address])[1]
    )
    if @contact.save
      render "show.json.jb"
    else
      render json: {errors: @contact.errors.full_messages}, status: :unprocessable_entity 
    end
  end

  def update
    @contact = Contact.find_by(id: params[:id])
    @contact.first_name = params[:first_name] || @contact.first_name
    @contact.middle_name = params[:middle_name] || @contact.middle_name
    @contact.last_name = params[:last_name] || @contact.last_name
    @contact.phone_number = params[:phone_number] || @contact.phone_number
    @contact.email= params[:email] || @contact.email
    @contact.bio = params[:bio] || @contact.bio
    @contact.longitude = Geocoder.coordinates(params[:address])[0]
    @contact.latitude = Geocoder.coordinates(params[:address])[1]
    
    if @contact.save
      render "show.json.jb"
    else
      render json: {errors: @contact.errors.full_messages}, status: :unprocessable_entity 
    end
  end

  def destroy
    @contact = Contact.find_by(id: params[:id])
    @contact.destroy
    render json: {message: "#{@contact.first_name} #{@contact.last_name}, id:#{@contact.id} has been deleted"}    
  end
end
