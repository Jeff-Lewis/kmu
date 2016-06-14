class Search < ActiveRecord::Base
    
    validates :name, presence: true
    validate :valid_ages?

    belongs_to :user

    before_validation :update_geo_address
      
    geocoded_by :geo_address
    after_validation :geocode

    def update_geo_address
      self.geo_address = self.address1 + " " + address2 + " " + address3
    end

      def valid_ages?
        if age_from != nil and age_to != nil
            if age_from > 0 or age_to > 0
              if age_from < age_to
                return true
              end
            end
            errors.add(:age_from, "invalid age")
        end
      end

    def build_sql
        sql_string = ""
        first = true
        case self.search_domain
        when "Privatpersonen"
            sql_string = "SELECT * FROM users WHERE active = 't' AND anonymous = 'f'"
            if self.age_from != nil
                end_date = Date.new(Date.today.year - age_from, Date.today.month, Date.today.day)
                sql_string = sql_string + " AND dateofbirth <= '" + end_date.to_s + "'"
            end
            if self.age_to != nil 
                start_date = Date.new(Date.today.year - age_to, Date.today.month, Date.today.day)
                sql_string = sql_string + " AND dateofbirth >= '" + start_date.to_s + "'"
            end
            if self.social
                sql_string = sql_string + " AND id IN (select user_id from services WHERE social = 't') "
            end
            if self.keywords != nil and self.keywords != ""
                sql_string = sql_string + " AND (name LIKE '%"+self.keywords+"%' OR lastname LIKE '%"+self.keywords+"%')"
            end
            if self.distance > 0 and self.longitude != nil and self.latitude != nil
                @users = User.near(self.geo_address, self.distance)
                uli = ""
                @users.each do |user|
                    uli = uli + user.id.to_s + ","
                end
                if !uli.blank?
                    sql_string = sql_string + " AND id IN (" +  uli.at(0..-2) + ")"
                else
                    sql_string = sql_string + " AND id=0"
                end
            end
        
        when "Institutionen"
            sql_string = "SELECT * FROM companies WHERE active ='t' "

            if self.category_id != "" and self.category_id != nil and self.category_id.to_s.length != 0
                sql_string = sql_string + " AND category_id = "+ self.category_id.to_s
            end
            if self.social == true
                sql_string = sql_string + " AND social = 't' "
            end
            if self.special
                sql_string = sql_string + " AND id IN (select company_id from services WHERE stype = 'action') "
            end
            if self.keywords != nil and self.keywords != ""
                sql_string = sql_string + " AND (name LIKE '%"+self.keywords+"%')"
            end
            if self.distance > 0 and self.longitude != nil and self.latitude != nil
                @companies = Company.near(self.geo_address, self.distance)
                uli = ""
                @companies.each do |company|
                    uli = uli + company.id.to_s + ","
                end
                if !uli.blank?
                    sql_string = sql_string + " AND id IN (" +  uli.at(0..-2) + ")"
                else
                    sql_string = sql_string + " AND id=0"
                end
            end

        when "Ausschreibungen"
            sql_string = "SELECT * FROM bids WHERE active = 't' "

            if self.category_id != "" and self.category_id != nil and self.category_id.to_s.length != 0
                sql_string = sql_string + " AND category_id = "+ self.category_id.to_s
            end
            if self.keywords != nil and self.keywords != ""
                sql_string = sql_string + " AND (name LIKE '%"+self.keywords+"%')"
            end
            if self.date_from != nil and self.date_to != nil
                sql_string = sql_string + " AND (date_from >= '" + self.date_from.to_s + "' AND date_to <= '" + self.date_to.to_s + "') OR (date_to >= '" + self.date_from.to_s + "' AND date_to <= '" + self.date_to.to_s + "')"
            end
            if self.distance > 0 and self.longitude != nil and self.latitude != nil
                @users = User.near(self.geo_address, self.distance)
                uli = ""
                @users.each do |user|
                    uli = uli + user.id.to_s + ","
                end
                if !uli.blank?
                    sql_string = sql_string + " AND user_id IN (" +  uli.at(0..-2) + ")"
                else
                    sql_string = sql_string + " AND user_id=0"
                end
            end

        when "Angebote"
            sql_string = "SELECT * FROM services WHERE active = 't' "

            if self.keywords != nil and self.keywords != ""
                sql_string = sql_string + " AND (name LIKE '%"+self.keywords+"%')"
            end
            if self.rating != nil and self_rating > 0
                sql_string = sql_string + " AND id IN (select service_id from ratings WHERE user_rating >= " + self.rating.to_s + ")"
            end 
            if self.distance > 0 and self.longitude != nil and self.latitude != nil
                @users = User.near(self.geo_address, self.distance)
                uli = "  "
                @users.each do |user|
                    uli = uli + user.id.to_s + ","
                end
                @companies = Company.near(self.geo_address, self.distance)
                cli = "  "
                @companies.each do |company|
                    cli = cli + company.id.to_s + ","
                end
                if !uli.blank? and !cli.blank?
                    sql_string = sql_string + " AND (user_id IN (" +  uli.at(0..-2) + ") OR company_id IN (" +cli.at(0..2) +"))"
                end
                if !uli.blank? and cli.blank?
                    sql_string = sql_string + " AND user_id IN (" +  uli.at(0..-2) + ")"
                end
                if !cli.blank? and uli.blank?
                    sql_string = sql_string + " AND company_id IN (" +  cli.at(0..-2) + ")"
                end
                if uli.blank? and cli.blank?    
                    sql_string = sql_string + " AND user_id=0"
                end
            end

        when "Aktionen"
            sql_string = "SELECT * FROM services WHERE active = 't' AND stype = 'action' " 

            if self.keywords != nil and self.keywords != ""
                sql_string = sql_string + " AND (name LIKE '%"+self.keywords+"%')"
            end
            if self.rating != nil and self.rating > 0
                sql_string = sql_string + " AND id IN (select service_id from ratings WHERE user_rating >= " + self.rating.to_s + ")"
            end 
            if self.date_from != nil
                sql_string = sql_string + " AND datum_von >= '" + self.date_from.to_s + "'"
            end
            if self.date_to != nil 
                sql_string = sql_string + " AND datum_bis <= '" + self.date_to.to_s + "'"
            end
            if self.distance > 0 and self.longitude != nil and self.latitude != nil
                @users = User.near(self.geo_address, self.distance)
                uli = "  "
                @users.each do |user|
                    uli = uli + user.id.to_s + ","
                end
                @companies = Company.near(self.geo_address, self.distance)
                cli = "  "
                @companies.each do |company|
                    cli = cli + company.id.to_s + ","
                end
                if !uli.blank? and !cli.blank?
                    sql_string = sql_string + " AND (user_id IN (" +  uli.at(0..-2) + ") OR company_id IN (" +cli.at(0..2) +"))"
                end
                if !uli.blank? and cli.blank?
                    sql_string = sql_string + " AND user_id IN (" +  uli.at(0..-2) + ")"
                end
                if !cli.blank? and uli.blank?
                    sql_string = sql_string + " AND company_id IN (" +  cli.at(0..-2) + ")"
                end
                if uli.blank? and cli.blank?    
                    sql_string = sql_string + " AND user_id=0"
                end
            end

            
        when "Mobilien"
            sql_string = "SELECT * FROM vehicles WHERE active = 't' "

            if self.mob_category_id != "" and self.mob_category_id != nil and self.mob_category_id.to_s.length != 0
                sql_string = sql_string + " AND mob_category_id = "+ self.mob_category_id.to_s
            end
            if self.keywords != nil and self.keywords != ""
                sql_string = sql_string + " AND (name LIKE '%"+self.keywords+"%')"
            end
            if self.distance > 0 and self.longitude != nil and self.latitude != nil
                @vehicles = Vehicle.near(self.geo_address, self.distance)
                uli = ""
                @vehicles.each do |vehicle|
                    uli = uli + vehicle.id.to_s + ","
                end
                if !uli.blank?
                    sql_string = sql_string + " AND id IN (" +  uli.at(0..-2) + ")"
                else
                    sql_string = sql_string + " AND id=0"
                end
            end
            
        when "Kleinanzeigen"
            sql_string = "SELECT * FROM requests WHERE active = 't' "

            if self.keywords != nil and self.keywords != ""
                sql_string = sql_string + " AND (name LIKE '%"+self.keywords+"%')"
            end
            if self.rtype != nil or self.rtype != ""
                sql_string = sql_string + " AND rtype='"+self.rtype+"'"
            end 
            if self.social == true
                sql_string = sql_string + " AND social = 't' "
            end
            if self.distance > 0 and self.longitude != nil and self.latitude != nil
                @users = User.near(self.geo_address, self.distance)
                uli = ""
                @users.each do |user|
                    uli = uli + user.id.to_s + ","
                end
                if !uli.blank?
                    sql_string = sql_string + " AND user_id IN (" +  uli.at(0..-2) + ")"
                else
                    sql_string = sql_string + " AND user_id=0"
                end
            end

        when "Stellenanzeigen"
            sql_string = "SELECT * FROM jobs WHERE active = 't' "

            if self.keywords != nil and self.keywords != ""
                sql_string = sql_string + " AND (name LIKE '%"+self.keywords+"%')"
            end
            if self.category_id != "" and self.category_id != nil and self.category_id.to_s.length != 0
                sql_string = sql_string + " AND company_id IN (SELECT id from companies WHERE category_id="+ self.category_id.to_s + ")"
            end
            if self.distance > 0 and self.longitude != nil and self.latitude != nil
                @companies = Company.near(self.geo_address, self.distance)
                uli = ""
                @companies.each do |company|
                    uli = uli + company.id.to_s + ","
                end
                if !uli.blank?
                    sql_string = sql_string + " AND company_id IN (" +  uli.at(0..-2) + ")"
                else
                    sql_string = sql_string + " AND company_id=0"
                end
            end

        when "Veranstaltungen"
            sql_string = "SELECT * FROM events WHERE active = 't' "

            if self.keywords != nil and self.keywords != ""
                sql_string = sql_string + " AND (name LIKE '%"+self.keywords+"%')"
            end
            if self.ev_category_id != "" and self.ev_category_id != nil and self.ev_category_id.to_s.length != 0
                sql_string = sql_string + " AND ev_category_id="+ self.ev_category_id.to_s
            end
            if self.date_from != nil
                sql_string = sql_string + " AND date_from >= '" + self.date_from.to_s + "'"
            end
            if self.date_to != nil 
                sql_string = sql_string + " AND date_to <= '" + self.date_to.to_s + "'"
            end
            if self.distance > 0 and self.longitude != nil and self.latitude != nil
                @events = Event.near(self.geo_address, self.distance)
                uli = ""
                @events.each do |event|
                    uli = uli + event.id.to_s + ","
                end
                if !uli.blank?
                    sql_string = sql_string + " AND id IN (" +  uli.at(0..-2) + ")"
                else
                    sql_string = sql_string + " AND id=0"
                end
            end

        when "Sehenswuerdigkeiten"
            sql_string = "SELECT * FROM hotspots WHERE active = 't' "

            if self.hs_category_id != "" and self.hs_category_id != nil and self.hs_category_id.to_s.length != 0
                sql_string = sql_string + " AND hs_category_id = "+ self.hs_category_id.to_s
            end
            if self.keywords != nil and self.keywords != ""
                sql_string = sql_string + " AND (name LIKE '%"+self.keywords+"%')"
            end
            if self.distance > 0 and self.longitude != nil and self.latitude != nil
                @hotspots = Hotspot.near(self.geo_address, self.distance)
                uli = ""
                @hotspots.each do |hotspot|
                    uli = uli + hotspot.id.to_s + ","
                end
                if !uli.blank?
                    sql_string = sql_string + " AND id IN (" +  uli.at(0..-2) + ")"
                else
                    sql_string = sql_string + " AND id=0"
                end
            end
            
        when "Spendeninitiativen"
            sql_string = "SELECT * FROM donations WHERE active = 't' "

            if self.keywords != nil and self.keywords != ""
                sql_string = sql_string + " AND (name LIKE '%"+self.keywords+"%')"
            end
            if self.amount_from_target != nil
                sql_string = sql_string + " AND amount >= " + self.amount_from_target.to_s
            end
            if self.amount_to_target != nil 
                sql_string = sql_string + " AND amount <= " + self.amount_to_target.to_s
            end
            if self.amount_from != nil
                sql_string = sql_string + " AND id IN (SELECT donation_id FROM donation_stats GROUP BY donation_id HAVING SUM(amount) >= " + self.amount_from.to_s + ")"
            end
            if self.amount_to != nil
                sql_string = sql_string + " AND id IN (SELECT donation_id FROM donation_stats GROUP BY donation_id HAVING SUM(amount) <= " + self.amount_to.to_s + ")"
            end
            if self.distance > 0 and self.longitude != nil and self.latitude != nil
                @companies = Company.near(self.geo_address, self.distance)
                uli = ""
                @companies.each do |company|
                    uli = uli + company.id.to_s + ","
                end
                if !uli.blank?
                    sql_string = sql_string + " AND id IN (" +  uli.at(0..-2) + ")"
                else
                    sql_string = sql_string + " AND id=0"
                end
            end

        end
        self.sql_string = sql_string
        if sql_string != nil
            User.find_by_sql(sql_string).count
        end
    end
end
