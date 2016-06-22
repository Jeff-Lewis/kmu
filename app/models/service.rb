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

      def self.search(cw, year, stype, filter, search)
        if cw != nil and year != nil
          start_date = Date.commercial(year,cw,1)
          end_date = Date.commercial(year,cw,7)
          where('name LIKE ? and stype=? and active=? and ((date_from >=? and date_from<=?) or (date_to>=? and date_to<=?) or (date_from<=? and date_to>=?))', "%#{search}%", stype, true, start_date, end_date, start_date, end_date, start_date, end_date)
        else
          if filter
            where(Search.find(filter).sql_string)
          else
            if search
              where('name LIKE ? and active=? and stype=?', "%#{search}%", true, stype)
            else
              where('active=? and stype=?', true, stype)
            end
          end
        end
      end 

    def valid_dates?
      if stype == "action"
        if date_from.to_date.is_a?(Date) and date_to.to_date.is_a?(Date)
          if self.date_from <= self.date_to
            return true
          else
            errors.add(:Date_from, "not lower ")
            puts "Erros" + date_from.to_s + date_to.to_s
          end
        end
        errors.add(:Date_from, "invalid date or time")
        puts "no DateTimes" + date_from.to_s + date_to.to_s
      end
    end

end
