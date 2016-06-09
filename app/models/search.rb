class Search < ActiveRecord::Base
    
    validates :name, presence: true
    validate :valid_ages?

    belongs_to :user

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

        when "Angebote"
            sql_string = "SELECT * FROM services WHERE active = 't' "

            if self.keywords != nil and self.keywords != ""
                sql_string = sql_string + " AND (name LIKE '%"+self.keywords+"%')"
            end
            if self.rating > 0
                sql_string = sql_string + " AND id IN (select service_id from ratings WHERE user_rating >= " + self.rating.to_s + ")"
            end 

        when "Aktionen"
            sql_string = "SELECT * FROM services WHERE active = 't' AND stype = 'action' " 

            if self.keywords != nil and self.keywords != ""
                sql_string = sql_string + " AND (name LIKE '%"+self.keywords+"%')"
            end
            if self.rating > 0
                sql_string = sql_string + " AND id IN (select service_id from ratings WHERE user_rating >= " + self.rating.to_s + ")"
            end 
            if self.date_from != nil
                sql_string = sql_string + " AND datum_von >= '" + self.date_from.to_s + "'"
            end
            if self.date_to != nil 
                sql_string = sql_string + " AND datum_bis <= '" + self.date_to.to_s + "'"
            end

            
        when "Mobilien"
            sql_string = "SELECT * FROM vehicles WHERE active = 't' "

            if self.mob_category_id != "" and self.mob_category_id != nil and self.mob_category_id.to_s.length != 0
                sql_string = sql_string + " AND mob_category_id = "+ self.mob_category_id.to_s
            end
            if self.keywords != nil and self.keywords != ""
                sql_string = sql_string + " AND (name LIKE '%"+self.keywords+"%')"
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

        when "Stellenanzeigen"
            sql_string = "SELECT * FROM jobs WHERE active = 't' "

            if self.keywords != nil and self.keywords != ""
                sql_string = sql_string + " AND (name LIKE '%"+self.keywords+"%')"
            end
            if self.category_id != "" and self.category_id != nil and self.category_id.to_s.length != 0
                sql_string = sql_string + " AND company_id IN (SELECT id from companies WHERE category_id="+ self.category_id.to_s + ")"
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
            
        when "Sehenswuerdigkeiten"
            sql_string = "SELECT * FROM hotspots WHERE active = 't' "

            if self.hs_category_id != "" and self.hs_category_id != nil and self.hs_category_id.to_s.length != 0
                sql_string = sql_string + " AND hs_category_id = "+ self.hs_category_id.to_s
            end
            if self.keywords != nil and self.keywords != ""
                sql_string = sql_string + " AND (name LIKE '%"+self.keywords+"%')"
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

        end
        self.sql_string = sql_string
        if sql_string != nil
            User.find_by_sql(sql_string).count
        end
    end
end
