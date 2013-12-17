 class GooglePlacesController < ApplicationController
   #if location needs to be set before user signs in, uncomment this line
   skip_before_filter :require_signin 

   def index
   end

   def set_session
    location = Geolocator.new(params[:latitude], params[:longitude])
    session[:current_position] = location
    head :no_content
   end

   def show
    @geolocator = session[:current_position]
    @API_Key = 'AIzaSyCkAVK_RgfGtiuhtXhDCj1exNMaifXDJ80'
    @client = GooglePlaces::Client.new(@API_Key)
    @spotList = @client.spots(@geolocator.latitude.to_f, @geolocator.longitude.to_f, :types => ['restaurant','food'])

    render :json => @spotList
   end
end


