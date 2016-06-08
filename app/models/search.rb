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
        when "Personen"
            sql_string = "SELECT * FROM users "
            if self.age_from != nil
                end_date = Date.new(Date.today.year - age_from, Date.today.month, Date.today.day)
                if first
                    sql_string = sql_string + " WHERE "
                    first = false
                else
                    sql_string = sql_string + " AND "
                end
                sql_string = sql_string + "dateofbirth <= '" + end_date.to_s + "'"
            end
            if self.age_to != nil 
                start_date = Date.new(Date.today.year - age_to, Date.today.month, Date.today.day)
                if first
                    sql_string = sql_string + " WHERE "
                    first = false
                else
                    sql_string = sql_string + " AND "
                end
                sql_string = sql_string + "dateofbirth >= '" + start_date.to_s + "'"
            end
            if self.social
                if first
                    sql_string = sql_string + " WHERE "
                    first = false
                else
                    sql_string = sql_string + " AND "
                end
                sql_string = sql_string + " id IN (select user_id from services WHERE social = 't') "
            end
            if self.keywords != nil and self.keywords != ""
                if first
                    sql_string = sql_string + " WHERE "
                    first = false
                else
                    sql_string = sql_string + " AND "
                end
                sql_string = sql_string + " (name LIKE '%"+self.keywords+"%' OR lastname LIKE '%"+self.keywords+"%')"
            end
        
        when "Institutionen"
            sql_string = "SELECT * FROM companies "

            if self.category_id != "" and self.category_id != nil and self.category_id.to_s.length != 0
                if first
                    sql_string = sql_string + " WHERE "
                    first = false
                else
                    sql_string = sql_string + " AND "
                end
                sql_string = sql_string + " category_id = "+ self.category_id.to_s
            end
            if self.social == true
                if first
                    sql_string = sql_string + " WHERE "
                    first = false
                else
                    sql_string = sql_string + " AND "
                end
                sql_string = sql_string + " social = 't' "
            end
            if self.special
                if first
                    sql_string = sql_string + " WHERE "
                    first = false
                else
                    sql_string = sql_string + " AND "
                end
                sql_string = sql_string + " id IN (select company_id from services WHERE stype = 'action') "
            end
            if self.keywords != nil and self.keywords != ""
                if first
                    sql_string = sql_string + " WHERE "
                    first = false
                else
                    sql_string = sql_string + " AND "
                end
                sql_string = sql_string + " (name LIKE '%"+self.keywords+"%')"
            end

        when "Ausschreibungen"
            sql_string = "SELECT * FROM bids "

            if self.category_id != "" and self.category_id != nil and self.category_id.to_s.length != 0
                if first
                    sql_string = sql_string + " WHERE "
                    first = false
                else
                    sql_string = sql_string + " AND "
                end
                sql_string = sql_string + " category_id = "+ self.category_id.to_s
            end
            if self.keywords != nil and self.keywords != ""
                if first
                    sql_string = sql_string + " WHERE "
                    first = false
                else
                    sql_string = sql_string + " AND "
                end
                sql_string = sql_string + " (name LIKE '%"+self.keywords+"%')"
            end
            if self.date_from != nil and self.date_to != nil
                if first
                    sql_string = sql_string + " WHERE "
                    first = false
                else
                    sql_string = sql_string + " AND "
                end
                sql_string = sql_string + "(date_from >= '" + self.date_from.to_s + "' AND date_to <= '" + self.date_to.to_s + "') OR (date_to >= '" + self.date_from.to_s + "' AND date_to <= '" + self.date_to.to_s + "')"
            end
            if self.age_to != nil 
                start_date = Date.new(Date.today.year - age_to, Date.today.month, Date.today.day)
                if first
                    sql_string = sql_string + " WHERE "
                    first = false
                else
                    sql_string = sql_string + " AND "
                end
                sql_string = sql_string + "dateofbirth >= '" + start_date.to_s + "'"
            end
             
        when "Angebote"
            sql_string = "SELECT * FROM services "

            if self.keywords != nil and self.keywords != ""
                if first
                    sql_string = sql_string + " WHERE "
                    first = false
                else
                    sql_string = sql_string + " AND "
                end
                sql_string = sql_string + " (name LIKE '%"+self.keywords+"%')"
            end
            if self.rating > 0
                if first
                    sql_string = sql_string + " WHERE "
                    first = false
                else
                    sql_string = sql_string + " AND "
                end
                sql_string = sql_string + " id IN (select service_id from ratings WHERE user_rating >= " + self.rating.to_s + ")"
            end 

        when "Aktionen"
            sql_string = "SELECT * FROM services "

            if self.keywords != nil and self.keywords != ""
                if first
                    sql_string = sql_string + " WHERE "
                    first = false
                else
                    sql_string = sql_string + " AND "
                end
                sql_string = sql_string + " (name LIKE '%"+self.keywords+"%')"
            end
            if self.rating > 0
                if first
                    sql_string = sql_string + " WHERE "
                    first = false
                else
                    sql_string = sql_string + " AND "
                end
                sql_string = sql_string + " id IN (select service_id from ratings WHERE user_rating >= " + self.rating.to_s + ")"
            end 
            if self.date_from != nil
                if first
                    sql_string = sql_string + " WHERE "
                    first = false
                else
                    sql_string = sql_string + " AND "
                end
                sql_string = sql_string + "datum_von >= '" + self.date_from.to_s + "'"
            end
            if self.date_to != nil 
                if first
                    sql_string = sql_string + " WHERE "
                    first = false
                else
                    sql_string = sql_string + " AND "
                end
                sql_string = sql_string + "datum_bis <= '" + self.date_to.to_s + "'"
            end

            
        when "Mobilien"
            sql_string = "SELECT * FROM vehicles "

            if self.mob_category_id != "" and self.mob_category_id != nil and self.mob_category_id.to_s.length != 0
                if first
                    sql_string = sql_string + " WHERE "
                    first = false
                else
                    sql_string = sql_string + " AND "
                end
                sql_string = sql_string + " mob_category_id = "+ self.mob_category_id.to_s
            end
            if self.keywords != nil and self.keywords != ""
                if first
                    sql_string = sql_string + " WHERE "
                    first = false
                else
                    sql_string = sql_string + " AND "
                end
                sql_string = sql_string + " (name LIKE '%"+self.keywords+"%')"
            end
            
        when "Kleinanzeigen"
            sql_string = "SELECT * FROM requests "

            if self.keywords != nil and self.keywords != ""
                if first
                    sql_string = sql_string + " WHERE "
                    first = false
                else
                    sql_string = sql_string + " AND "
                end
                sql_string = sql_string + " (name LIKE '%"+self.keywords+"%')"
            end
            if self.rtype != nil or self.rtype != ""
                if first
                    sql_string = sql_string + " WHERE "
                    first = false
                else
                    sql_string = sql_string + " AND "
                end
                sql_string = sql_string + " rtype='"+self.rtype+"'"
            end 
            if self.social == true
                if first
                    sql_string = sql_string + " WHERE "
                    first = false
                else
                    sql_string = sql_string + " AND "
                end
                sql_string = sql_string + " social = 't' "
            end

        when "Stellenanzeigen"
            sql_string = "SELECT * FROM jobs "

            if self.keywords != nil and self.keywords != ""
                if first
                    sql_string = sql_string + " WHERE "
                    first = false
                else
                    sql_string = sql_string + " AND "
                end
                sql_string = sql_string + " (name LIKE '%"+self.keywords+"%')"
            end
            if self.category_id != "" and self.category_id != nil and self.category_id.to_s.length != 0
                if first
                    sql_string = sql_string + " WHERE "
                    first = false
                else
                    sql_string = sql_string + " AND "
                end
                sql_string = sql_string + " company_id IN (SELECT id from companies WHERE category_id="+ self.category_id.to_s + ")"
            end

        when "Veranstaltungen"
            sql_string = "SELECT * FROM events "

            if self.keywords != nil and self.keywords != ""
                if first
                    sql_string = sql_string + " WHERE "
                    first = false
                else
                    sql_string = sql_string + " AND "
                end
                sql_string = sql_string + " (name LIKE '%"+self.keywords+"%')"
            end
            if self.ev_category_id != "" and self.ev_category_id != nil and self.ev_category_id.to_s.length != 0
                if first
                    sql_string = sql_string + " WHERE "
                    first = false
                else
                    sql_string = sql_string + " AND "
                end
                sql_string = sql_string + " ev_category_id="+ self.ev_category_id.to_s
            end
            if self.date_from != nil
                if first
                    sql_string = sql_string + " WHERE "
                    first = false
                else
                    sql_string = sql_string + " AND "
                end
                sql_string = sql_string + "date_from >= '" + self.date_from.to_s + "'"
            end
            if self.date_to != nil 
                if first
                    sql_string = sql_string + " WHERE "
                    first = false
                else
                    sql_string = sql_string + " AND "
                end
                sql_string = sql_string + "date_to <= '" + self.date_to.to_s + "'"
            end
            
        when "Sehenswuerdigkeiten"
            sql_string = "SELECT * FROM hotspots "

            if self.hs_category_id != "" and self.hs_category_id != nil and self.hs_category_id.to_s.length != 0
                if first
                    sql_string = sql_string + " WHERE "
                    first = false
                else
                    sql_string = sql_string + " AND "
                end
                sql_string = sql_string + " hs_category_id = "+ self.hs_category_id.to_s
            end
            if self.keywords != nil and self.keywords != ""
                if first
                    sql_string = sql_string + " WHERE "
                    first = false
                else
                    sql_string = sql_string + " AND "
                end
                sql_string = sql_string + " (name LIKE '%"+self.keywords+"%')"
            end
            

        when "Spendeninitiativen"
            sql_string = "SELECT * FROM donations "

            if self.keywords != nil and self.keywords != ""
                if first
                    sql_string = sql_string + " WHERE "
                    first = false
                else
                    sql_string = sql_string + " AND "
                end
                sql_string = sql_string + " (name LIKE '%"+self.keywords+"%')"
            end
            if self.amount_from_target != nil
                if first
                    sql_string = sql_string + " WHERE "
                    first = false
                else
                    sql_string = sql_string + " AND "
                end
                sql_string = sql_string + "amount >= " + self.amount_from_target.to_s
            end
            if self.amount_to_target != nil 
                if first
                    sql_string = sql_string + " WHERE "
                    first = false
                else
                    sql_string = sql_string + " AND "
                end
                sql_string = sql_string + "amount <= " + self.amount_to_target.to_s
            end
            if self.amount_from != nil
                if first
                    sql_string = sql_string + " WHERE "
                    first = false
                else
                    sql_string = sql_string + " AND "
                end
                sql_string = sql_string + " id IN (SELECT donation_id FROM donation_stats GROUP BY donation_id HAVING SUM(amount) >= " + self.amount_from.to_s + ")"
            end
            if self.amount_to != nil
                if first
                    sql_string = sql_string + " WHERE "
                    first = false
                else
                    sql_string = sql_string + " AND "
                end
                sql_string = sql_string + " id IN (SELECT donation_id FROM donation_stats GROUP BY donation_id HAVING SUM(amount) <= " + self.amount_to.to_s + ")"
            end


        end
        self.sql_string = sql_string
        if sql_string != nil and sql_string != ""
            puts sql_string
            User.find_by_sql(sql_string).count
        end 
    end

    def concat(first)
        if first 
            return "WHERE"
        else
            return "AND"
        end
    end
        
end
