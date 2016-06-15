module BidsHelper
    
    def BidDatum(datum, bid)
        if datum >= bid.date_from.to_date and datum <= bid.date_to.to_date
            return true
        else
            return false
        end
    end

end
