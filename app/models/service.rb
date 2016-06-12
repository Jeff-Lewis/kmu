class Service < ActiveRecord::Base
    
    belongs_to :company
    belongs_to :user
    has_many :ratings, dependent: :destroy 
    
    validates :name, presence: true
    validate :valid_dates?
    
    has_attached_file :avatar, default_url: "/images/:style/missing.png", :styles => {:big => "800x800", :medium => "300x300#", :thumb => "100x100#", :small => "50x50#" }
    validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
    
    def self.avg_rating(service)
        where("service_id=?", service).average(:user_rating) 
    end

      def self.ext_sql (cw, year, sql)
        start_date = Date.commercial(year,cw,1)
        end_date = Date.commercial(year,cw,7)
        sql = sql + " AND ((datum_von >= '" + start_date.to_s + "' AND datum_von <= '" + end_date.to_s + "') OR (datum_bis >= '" + start_date.to_s + "' AND datum_bis <= '" + end_date.to_s + "') OR (datum_von <= '" + start_date.to_s + "' AND datum_bis >= '" + end_date.to_s + "'))"
      end

      def self.actionsearch(cw, year, search)
        start_date = Date.commercial(year,cw,1)
        end_date = Date.commercial(year,cw,7)
        where('name LIKE ? and stype=? and active=? and ((datum_von>=? and datum_von<=?) or (datum_bis>=? and datum_bis<=?) or (datum_von<=? and datum_bis>=?))', "%#{search}%", "action", true, start_date, end_date, start_date, end_date, start_date, end_date)
      end 

      def self.search(search)
          if search
            where('stype=? and active=? and (stichworte LIKE ? OR name LIKE ?)', "regular", true, "%#{search}%", "%#{search}%")
          else
            where('stype=? and active=?', "regular", true)
          end
      end

    def valid_dates?
      if stype == "action"
        if datum_von.is_a?(Date) and datum_bis.is_a?(Date)
          if datum_von <= datum_bis
            return true
          end
        end
        errors.add(:Date_from, "invalid date or time")
      end
    end

end
