class Api::ContactsController < ApplicationController

  def index
    # if current_user
    #   @contacts = current_user.contacts

      @contacts = Contact.all
      if params[:search]
        @contacts = @contacts.where("first_name iLIKE ? OR middle_name iLIKE ? OR last_name iLIKE ? OR bio iLIKE ? OR email iLIKE ? OR phone_number iLIKE ?", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%")
      end

      # if params[:group]
      #   group = Group.find_by(name: params[:group])
      #   @contacts = group.contacts.where(user_id: current_user.id)
      # end

      @contacts = @contacts.order(:id)
      render 'index.json.jb'
    # else
    #   render json: []
    # end
  end

  def show
    @contact = Contact.find_by(id: params[:id])
    render 'show.json.jb'
  end

  def create
    # address = "1441 W Carmen Avem Chicago, IL"
    # coordinates - Geocoder.coordinates(params[:address])

    @contact = Contact.create(
      id: params[:id],
      first_name: params[:first_name],
      middle_name: params[:middle_name],
      last_name: params[:last_name],
      bio: params[:bio],
      email: params[:email],
      phone_number: params[:phone_number],
      # latitude: coordinates[0],
      # longitude: coordinates[1],
      user_id: current_user.id
    )
    if @contact.save
      render 'show.json.jb'
    else
      render json: {errors: @contact.errors.full_messages}, status: 422
    end
  end

  def update
    @contact = Contact.find_by(id: params[:id])

    # coordinates = Geocoder.coordinates(params[:address])
    
    @contact.id = params[:id] || @contact.id
    @contact.first_name = params[:first_name] || @contact.first_name
    @contact.middle_name = params[:middle_name] || @contact.middle_name
    @contact.last_name = params[:last_name] || @contact.last_name
    @contact.bio = params[:bio] || @contact.bio
    @contact.email = params[:email] || @contact.email
    @contact.phone_number = params[:phone_number] || @contact.phone_number
    # @contact.latitude = coordinates[0] || @contact.latitude
    # @contact.longitude = coordinates[1] || @contact.longitude
    @contact.save
    if @contact.save
      render 'show.json.jb'
    else
      render json: {errors: @contact.errors.full_messages}, status: 422
    end
  end

  def destroy
    contact = Contact.find_by(id: params[:id])
    contact.destroy
    render json: {message: "Contact Destroyed"}
  end

end
