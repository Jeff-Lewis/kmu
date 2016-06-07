module ServicesHelper
    
    def anz_rating(service)
        anz = Rating.where("service_id=?", service).count
        if anz != nil
            return anz
        else
            return 0
        end
    end

    def avg_rating(service)
        rat = Rating.where("service_id=?", service).average(:user_rating)
        if rat != nil
            return rat.round
        else
            return 0
        end
    end
end
