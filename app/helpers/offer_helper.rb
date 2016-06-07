module OfferHelper
    def AktionDatum(datum, service)
        if datum >= service.datum_von and datum <= service.datum_bis
            return true
        else
            return false
        end
    end
end
