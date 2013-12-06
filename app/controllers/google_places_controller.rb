class GooglePlacesController < ApplicationController
   def home
      @client = GooglePlaces::Client.new(AIzaSyCkAVK_RgfGtiuhtXhDCj1exNMaifXDJ80)
   end
end
