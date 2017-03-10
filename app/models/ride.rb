class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction

    def take_ride
        if too_short_and_too_poor?
            "Sorry. You do not have enough tickets the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
        elsif too_short?
            "Sorry. You are not tall enough to ride the #{attraction.name}."
        elsif too_poor?
            "Sorry. You do not have enough tickets the #{attraction.name}."
        else
            user.tickets -= attraction.tickets
            user.nausea += attraction.nausea_rating
            user.happiness += attraction.happiness_rating
            user.save
        end
    end

    def too_short_and_too_poor?
        too_short? && too_poor?        
    end

    def too_short?
        user.height < attraction.min_height
    end

    def too_poor?
        user.tickets < attraction.tickets
    end

end


