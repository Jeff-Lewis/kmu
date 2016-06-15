module OfferHelper
    def AktionDatum(datum, service)
        if datum >= service.date_from.to_date and datum <= service.date_to.to_date
            return true
        else
            return false
        end
    end
end
