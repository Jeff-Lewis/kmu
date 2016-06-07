module EventsHelper

    def EventDatum(datum, event)
        if datum >= event.date_from and datum <= event.date_to
            return true
        else
            return false
        end
    end
    
    def url_with_protocol(url)
        /^http/i.match(url) ? url : "http://#{url}"
    end

end
