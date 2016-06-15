module EventsHelper

    def EventDatum(datum, event)
        if datum >= event.date_from.to_date and datum <= event.date_to.to_date
            return true
        else
            return false
        end
    end
    
    def url_with_protocol(url)
        /^http/i.match(url) ? url : "http://#{url}"
    end

end
