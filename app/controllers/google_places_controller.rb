 class GooglePlacesController < ApplicationController
   def index
   end

   def show
      @API_Key = 'AIzaSyCkAVK_RgfGtiuhtXhDCj1exNMaifXDJ80'
      @client = GooglePlaces::Client.new(@API_Key)
      @spotList = @client.spots(-33.8670522, 151.1957362, :types => ['restaurant','food'])
   end
end
