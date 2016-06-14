module OfferHelper
    def AktionDatum(datum, service)
        if datum >= service.date_from and datum <= service.date_to
            return true
        else
            return false
        end
    end
end
