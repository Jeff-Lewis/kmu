class Search < ActiveRecord::Base
    
    def search_companies
        companies = Company.all
        companies = companies.where(["stichworte LIKE ?", "%#{keywords}%"]) if keywords.present?
#        companies = companies.where(["branche_id=?", noga]) if noga.present?
#        companies = companies.specials.count > 0 if special.present?
        return companies
    end
    
end
