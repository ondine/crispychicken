class EventsController < ApplicationController
	require 'date'
	require 'time'
	# before_action :set_event, only: [:show, :edit, :update, :destroy]
	before_action :correct_user,   only: :destroy

	def index
		@event = Event.new
	end

	def show
	    @events = Event.where(:user_id => current_user['id'] )
	    @indStr = 'A'
	    @hash = Gmaps4rails.build_markers(@events) do |event, marker|
	        marker.lat event.latitude
	        marker.lng event.longitude
	        marker.infowindow  "<h5>" + event.event_name + "</h5>"
	        marker.picture({"url" => "http://maps.google.com/mapfiles/kml/paddle/" + @indStr +"_maps.png",
	              "width" =>  32, 
	              "height" => 32 }) 
	        marker.json({event_name: event.event_name, address: event.address})  
	        @indStr = @indStr.succ      
	    end    
	end

	def edit

	end

	def create
	    @event = Event.new(event_params)

	    respond_to do |format|
	      if @event.save
	        format.html { redirect_to @event, notice: 'Event was successfully created.' }
	        format.js
	        format.json { render action: 'show', status: :created, location: @event }
	      else
	        format.html { render action: 'new' }
	        format.json { render json: @event.errors, status: :unprocessable_entity }
	      end
	    end
	end

	def update

	end

	def destroy
	    @event.delete
	    redirect_to events_path
	end

    def correct_user
      @event = current_user.events.find_by(id: params[:id])
      redirect_to events_path if @event.nil?
    end

	def event_params
      params.require(:event).permit(:location, :event_date, :event_time, :event_details, :latitude, :longitude, :address, :user_id, :event_name)
	end
end
