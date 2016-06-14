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
        sql = sql + " AND ((date_from >= '" + start_date.to_s + "' AND date_from <= '" + end_date.to_s + "') OR (date_to >= '" + start_date.to_s + "' AND date_to <= '" + end_date.to_s + "') OR (date_from <= '" + start_date.to_s + "' AND date_to >= '" + end_date.to_s + "'))"
      end

      def self.actionsearch(cw, year, search)
        start_date = Date.commercial(year,cw,1)
        end_date = Date.commercial(year,cw,7)
        where('name LIKE ? and stype=? and active=? and ((date_from >=? and date_from<=?) or (date_to>=? and date_to<=?) or (date_from<=? and date_to>=?))', "%#{search}%", "action", true, start_date, end_date, start_date, end_date, start_date, end_date)
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
        if date_from.is_a?(Date) and date_to.is_a?(Date)
          if date_from <= date_to
            return true
          end
        end
        errors.add(:Date_from, "invalid date or time")
      end
    end

end
