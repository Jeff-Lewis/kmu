class Search < ActiveRecord::Base
    
    serialize :sql_string, Array
    
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
        sql_string = []
        sql_string[0] ="active=?"
        sql_string << true
        case self.search_domain
        when "Privatpersonen", "Tickets"
            sql_string[0] = sql_string[0] + " and anonymous=?"
            sql_string << false
            if self.age_from != nil and self.age_from > 0
                end_date = Date.new(Date.today.year - age_from, Date.today.month, Date.today.day)
                sql_string[0] = sql_string[0] + " and dateofbirth <=?"
                sql_string << end_date.to_s
            end
            if self.age_to != nil and self.age_to > 0
                start_date = Date.new(Date.today.year - age_to, Date.today.month, Date.today.day)
                sql_string[0] = sql_string[0] + " and dateofbirth >=?"
                sql_string << start_date.to_s
            end
            if self.social
                sql_string[0] = sql_string[0] + " and id IN (?)"
                @services = Service.where('social=?', 't')
                sli = []
                @services.each do |s|
                    sli << s.user_id
                end
                sql_string << sli
            end
            if self.keywords != nil and self.keywords != ""
                sql_string[0] = sql_string[0] + " and (name LIKE ? OR lastname LIKE ?)"
                sql_string << "%"+self.keywords+"%"
                sql_string << "%"+self.keywords+"%"
            end
            if self.distance > 0 and self.longitude != nil and self.latitude != nil
                sql_string[0] = sql_string[0] + " and id IN (?)"
                @users = User.near(self.geo_address, self.distance)
                uli = []
                @users.each do |user|
                    uli << user.id
                end
                sql_string << uli
            end
            if self.search_domain == "Tickets"
                if self.customer
                    sql_string[0] = sql_string[0] + " and id IN (?)"
                    cid = Ticket.find(self.ticket_id).sponsor.company.id
                    @customers = Customer.where('company_id=?', cid)
                    cli = []
                    @customers.each do |c|
                        cli << c.user_id
                    end
                    sql_string << cli
                end
            end

            self.sql_string = sql_string
            User.where(sql_string).count

        when "Institutionen"
            if self.category_id != "" and self.category_id != nil and self.category_id.to_s.length != 0
                sql_string[0] = sql_string[0] + " and category_id=?"
                sql_string << self.category_id
            end
            if self.social == true
                sql_string[0] = sql_string[0] + " and social=?"
                sql_string << true
            end
            if self.special
                sql_string[0] = sql_string[0] + " and id IN (select company_id from services WHERE stype = 'action') "
            end
            if self.keywords != nil and self.keywords != ""
                sql_string[0] = sql_string[0] + " and name LIKE ?"
                sql_string << "%" + self.keywords + "%"
            end
            if self.distance > 0 and self.longitude != nil and self.latitude != nil
                sql_string[0] = sql_string[0] + " and id IN (?)"
                @companies = Company.near(self.geo_address, self.distance)
                cli = []
                @companies.each do |company|
                    cli << company.id
                end
                sql_string << cli
            end
            self.sql_string = sql_string
            Company.where(sql_string).count

        when "Ausschreibungen"
            if self.category_id != "" and self.category_id != nil and self.category_id.to_s.length != 0
                sql_string[0] = sql_string[0] + " and category_id=?"
                sql_string << self.category_id
            end
            if self.keywords != nil and self.keywords != ""
                sql_string[0] = sql_string[0] + " and name LIKE ?"
                sql_string << "%" + self.keywords + "%"
            end
            if self.date_from != nil and self.date_to != nil
                sql_string[0] = sql_string[0] + " and ((date_from >=?"
                sql_string << self.date_from
                sql_string[0] = sql_string[0] + " and date_to <=?)"
                sql_string << self.date_to
                sql_string[0] = sql_string[0] + " or (date_from >=?"
                sql_string << self.date_from
                sql_string[0] = sql_string[0] + " and date_to <=?))"
                sql_string << self.date_to
            end
            if self.distance > 0 and self.longitude != nil and self.latitude != nil
                sql_string[0] = sql_string[0] + " and id IN (?)"
                @users = User.near(self.geo_address, self.distance)
                uli = []
                @users.each do |user|
                    uli << user.id
                end
                sql_string << uli
            end
            self.sql_string = sql_string
            Bid.where(sql_string).count

        when "Angebote"
            sql_string[0] = sql_string[0] + "and stype=?"
            sql_string << "regular"
            if self.social == true
                sql_string[0] = sql_string[0] + " and social=?"
                sql_string << true
            end
            if self.keywords != nil and self.keywords != ""
                sql_string[0] = sql_string[0] + " and name LIKE ?"
                sql_string << "%" + self.keywords + "%"
            end
            if self.rating != nil and self.rating > 0
                sql_string[0] = sql_string[0] + " and id IN (select service_id from ratings WHERE user_rating >=?)"
                sql_string << self.rating
            end 
            if self.distance > 0 and self.longitude != nil and self.latitude != nil
                @users = User.near(self.geo_address, self.distance)
                uli = []
                @users.each do |user|
                    uli << user.id
                end
                @companies = Company.near(self.geo_address, self.distance)
                cli = []
                @companies.each do |company|
                    cli << company.id
                end
                if !uli.blank? and cli.blank?
                    sql_string[0] = sql_string[0] + " and user_id IN (?)"
                    sql_string << uli
                end
                if uli.blank? and !cli.blank?
                    sql_string[0] = sql_string[0] + " and company_id IN (?)"
                    sql_string << cli
                end
                if !uli.blank? and !cli.blank?
                    sql_string[0] = sql_string[0] + " and (company_id IN (?) or user_id IN (?))"
                    sql_string << cli
                    sql_string << uli
                end
            end
            self.sql_string = sql_string
            Service.where(sql_string).count

        when "Aktionen"
            sql_string[0] = sql_string[0] + " and stype=?"
            sql_string << "action"
            if self.keywords != nil and self.keywords != ""
                sql_string[0] = sql_string[0] + " and name LIKE ?"
                sql_string << "%" + self.keywords + "%"
            end
            if self.rating != nil and self.rating > 0
                sql_string[0] = sql_string[0] + " and id IN (select service_id from ratings WHERE user_rating >=?)"
                sql_string << self.rating
            end 
            if self.distance > 0 and self.longitude != nil and self.latitude != nil
                @users = User.near(self.geo_address, self.distance)
                uli = []
                @users.each do |user|
                    uli << user.id
                end
                @companies = Company.near(self.geo_address, self.distance)
                cli = []
                @companies.each do |company|
                    cli << company.id
                end
                if !uli.blank? and cli.blank?
                    sql_string[0] = sql_string[0] + " and user_id IN (?)"
                    sql_string << uli
                end
                if uli.blank? and !cli.blank?
                    sql_string[0] = sql_string[0] + " and company_id IN (?)"
                    sql_string << cli
                end
                if !uli.blank? and !cli.blank?
                    sql_string[0] = sql_string[0] + " and (company_id IN (?) or user_id IN (?))"
                    sql_string << cli
                    sql_string << uli
                end
            end
            self.sql_string = sql_string
            Service.where(sql_string).count
            
        when "Mobilien"
            if self.mob_category_id != "" and self.mob_category_id != nil and self.mob_category_id.to_s.length != 0
                sql_string[0] = sql_string[0] + " and mob_category_id=?"
                sql_string << self.mob_category_id
            end
            if self.keywords != nil and self.keywords != ""
                sql_string[0] = sql_string[0] + " and name LIKE ?"
                sql_string << "%" + self.keywords + "%"
            end
            if self.distance > 0 and self.longitude != nil and self.latitude != nil
                sql_string[0] = sql_string[0] + " and id IN (?)"
                @vehicles = Vehicle.near(self.geo_address, self.distance)
                vli = []
                @vehicles.each do |v|
                    vli << v.id
                end
                sql_string << vli
            end
            self.sql_string = sql_string
            Vehicle.where(sql_string).count

        when "Kleinanzeigen"
            if self.keywords != nil and self.keywords != ""
                sql_string[0] = sql_string[0] + " and name LIKE ?"
                sql_string << "%" + self.keywords + "%"
            end
            if self.rtype != nil or self.rtype != ""
                sql_string[0] = sql_string[0] + " and rtype=?"
                sql_string << self.rtype
            end 
            if self.social == true
                sql_string[0] = sql_string[0] + " and social=?"
                sql_string << true
            end
            if self.distance > 0 and self.longitude != nil and self.latitude != nil
                sql_string[0] = sql_string[0] + " and user_id IN (?)"
                @users = User.near(self.geo_address, self.distance)
                uli = []
                @users.each do |user|
                    uli << user.id
                end
                sql_string << uli
            end
            self.sql_string = sql_string
            Request.where(sql_string).count

        when "Stellenanzeigen"
            if self.keywords != nil and self.keywords != ""
                sql_string[0] = sql_string[0] + " and name LIKE ?"
                sql_string << "%" + self.keywords + "%"
            end
            if self.category_id != "" and self.category_id != nil and self.category_id.to_s.length != 0
                sql_string[0] = sql_string[0] + " and company_id IN (SELECT id from companies WHERE category_id=?)"
                sql_string << self.category_id
            end
            if self.distance > 0 and self.longitude != nil and self.latitude != nil
                @companies = Company.near(self.geo_address, self.distance)
                sql_string[0] = sql_string[0] + " and company_id IN (?)"
                @companies = Company.near(self.geo_address, self.distance)
                cli = []
                @companies.each do |company|
                    cli << company.id
                end
                sql_string << cli
            end
            self.sql_string = sql_string
            Job.where(sql_string).count

        when "Veranstaltungen"
            if self.keywords != nil and self.keywords != ""
                sql_string[0] = sql_string[0] + " and name LIKE ?"
                sql_string << "%" + self.keywords + "%"
            end
            if self.ev_category_id != "" and self.ev_category_id != nil and self.ev_category_id.to_s.length != 0
                sql_string[0] = sql_string[0] + " and ev_category_id=?"
                sql_string << self.ev_category_id
            end
            if self.date_from != nil
                sql_string[0] = sql_string[0] + " and date_from >=?"
                sql_string << self.date_from
            end
            if self.date_to != nil 
                sql_string[0] = sql_string[0] + " and date_to <=?"
                sql_string << self.date_to
            end
            if self.distance > 0 and self.longitude != nil and self.latitude != nil
                @events = Event.near(self.geo_address, self.distance)
                sql_string[0] = sql_string[0] + " and id IN (?)"
                eli = []
                @events.each do |e|
                    eli << e.id
                end
                sql_string << eli
            end
            self.sql_string = sql_string
            Event.where(sql_string).count

        when "Sehenswuerdigkeiten"
            if self.hs_category_id != "" and self.hs_category_id != nil and self.hs_category_id.to_s.length != 0
                sql_string[0] = sql_string[0] + " and hs_category_id=?"
                sql_string << self.hs_category_id
            end
            if self.keywords != nil and self.keywords != ""
                sql_string[0] = sql_string[0] + " and name LIKE ?"
                sql_string << "%" + self.keywords + "%"
            end
            if self.distance > 0 and self.longitude != nil and self.latitude != nil
                sql_string[0] = sql_string[0] + " and id IN (?)"
                @hotspots = Hotspot.near(self.geo_address, self.distance)
                hli = []
                @hotspots.each do |h|
                    hli << h.id
                end
                sql_string << hli
            end
            self.sql_string = sql_string
            Hotspot.where(sql_string).count
            
        when "Spendeninitiativen", "Rewardinitiativen"
            sql_string[0] = sql_string[0] + " and dtype=?"
            if self.search_domain == "Spendeninitiativen"
                sql_string << "Donation"
            end
            if self.search_domain == "Rewardinitiativen"
                sql_string << "Reward"
            end
            if self.keywords != nil and self.keywords != ""
                sql_string[0] = sql_string[0] + " and name LIKE ?"
                sql_string << "%" + self.keywords + "%"
            end
            if self.amount_from_target != nil
                sql_string[0] = sql_string[0] + " and amount >=?"
                sql_string << self.amount_from_target
            end
            if self.amount_to_target != nil 
                sql_string[0] = sql_string[0] + " AND amount <=?"
                sql_string << self.amount_to_target
            end
            if self.amount_from != nil
                sql_string[0] = sql_string[0] + " and id IN (SELECT donation_id FROM donation_stats GROUP BY donation_id HAVING SUM(amount) >=?)"
                sql_string << self.amount_from
            end
            if self.amount_to != nil
                sql_string[0] = sql_string[0] + " and id IN (SELECT donation_id FROM donation_stats GROUP BY donation_id HAVING SUM(amount) <=?)"
                sql_string << self.amount_to
            end
            if self.distance > 0 and self.longitude != nil and self.latitude != nil
                if self.search_domain == "Spendeninitiativen"
                    sql_string[0] = sql_string[0] + " and company_id IN (?)"
                    @companies = Company.near(self.geo_address, self.distance)
                    cli = []
                    @companies.each do |company|
                        cli << company.id
                    end
                    sql_string << cli
                end
                if self.search_domain == "Rewardinitiativen"
                    sql_string[0] = sql_string[0] + " and (company_id IN (?)"
                    @companies = Company.near(self.geo_address, self.distance)
                    cli = []
                    @companies.each do |company|
                        cli << company.id
                    end
                    sql_string << cli
                    sql_string[0] = sql_string[0] + " or user_id IN (?))"
                    @users = User.near(self.geo_address, self.distance)
                    cli = []
                    @users.each do |user|
                        cli << user.id
                    end
                    sql_string << cli
                end
            end
            self.sql_string = sql_string
            Donation.where(sql_string).count
        end
    end
end
