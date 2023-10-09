class BookingsController < ApplicationController
	def new
		@event = Event.find_by(id: params[:event_id])
		@booking = Booking.new
	end

	def create
		@event = Event.find_by(id: params[:event_id])
		@booking = current_user.bookings.create(booking_params)

		if @booking.save
			redirect_to event_path(@event)
		else
			render :new
		end
	end

	private
		def booking_params
			params.require(:booking).permit(:quantity, :price)
		end
end