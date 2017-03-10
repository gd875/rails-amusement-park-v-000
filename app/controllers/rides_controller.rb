class RidesController < ApplicationController
    
    def create
        @user = User.find_by(id: session[:user_id])
        @attraction = Attraction.find_by(id: params[:id])
        @ride = Ride.create(attraction_id: @attraction.id, user_id: @user.id)
        @ride.take_ride
        if @ride.too_short_and_too_poor?
            flash[:message] = "Sorry. You do not have enough tickets to ride the #{@attraction.name}. You are not tall enough to ride the #{@attraction.name}."
        elsif @ride.too_short?
            flash[:message] = "Sorry. You are not tall enough to ride the #{@attraction.name}."
        elsif @ride.too_poor?
            flash[:message] = "Sorry. You do not have enough tickets to ride the #{@attraction.name}."
        else
            flash[:message] = "Thanks for riding the #{@attraction.name}!"
        end
        redirect_to user_path(@user)
    end

end