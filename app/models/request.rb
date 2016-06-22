class Request < ActiveRecord::Base
    
    belongs_to :user
    has_many :request_details, dependent: :destroy 

    validates :name, presence: true
    
    def self.search(filter, search, typ)
      if filter
          where(Search.find(filter).sql_string)
      else
        if search
          where('rtype=? and active=? and (stichworte LIKE ? OR name LIKE ?)', typ, true, "%#{search}%", "%#{search}%")
        else
          where('rtype=? and active=?', typ, true)
        end
      end
    end

end
