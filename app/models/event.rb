class Event < ActiveRecord::Base
    belongs_to :user
    belongs_to :company
    belongs_to :ev_category
    has_many :event_details, dependent: :destroy 
    has_many :sponsors, dependent: :destroy 
    
    validates :name, presence: true
    validates :ev_category, presence: true
   
    before_validation :update_geo_address
    
    validate :valid_dates?
      
    geocoded_by :geo_address
    after_validation :geocode
    
    def update_geo_address
      self.geo_address = self.address1 + " " + address2 + " " + address3
    end
    
  def self.ext_sql (cw, year, sql)
    if cw != nil and year != nil
      start_date = Date.commercial(year,cw,1)
      end_date = Date.commercial(year,cw,7)
      sql = sql + " AND ((date_from >= '" + start_date.to_s + "' AND date_from <= '" + end_date.to_s + "') OR (date_to >= '" + start_date.to_s + "' AND date_to <= '" + end_date.to_s + "') OR (date_from <= '" + start_date.to_s + "' AND date_to >= '" + end_date.to_s + "'))"
    else
      sql
    end
  end

  def self.search(cw, year, filter, search)
    if cw != nil and year != nil
      start_date = Date.commercial(year,cw,1)
      end_date = Date.commercial(year,cw,7)
      where('name LIKE ? and active=? and ((date_from>=? and date_from<=?) or (date_to>=? and date_to<=?) or (date_from<=? and date_to>=?))', "%#{search}%", true, start_date, end_date, start_date, end_date, start_date, end_date)
    else
      if filter
            @search = Search.find(filter)
            where(@search.build_sql)
      else
        if search != nil
          where('name LIKE ? and active=? ', "%#{search}%", true)
        else
          where('active=?',true)
        end
      end
    end
  end 
  
  def valid_dates?
    if date_from.to_date.is_a?(Date) and date_to.to_date.is_a?(Date)
      if date_from <= date_to
        return true
      end
    end
    errors.add(:Date_from, "invalid date or time")
  end

end
