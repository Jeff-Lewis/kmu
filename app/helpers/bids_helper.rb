module BidsHelper
    
    def BidDatum(datum, bid)
        if datum >= bid.date_from and datum <= bid.date_to
            return true
        else
            return false
        end
    end

end
