class RightsController < ApplicationController
  
  $company_id = ""
  $company_name = ""
  $array = []
  $suser = false

  def fill
    rights = Right.where("company_id=?", $company_id)
    $array = []
    rights.each do |r|
        $array << r.user_id.to_s
    end
    @c_user = User.where(:id => $array).order(:name)
    @p_user = User.all.order(:name)
    
    puts "Company Users: " + @c_user.count.to_s
    puts "Promis Users: " + @p_user.count.to_s

  end

  def index
    @p_user = User.all.order(:name)
    if params[:company_id] != nil
      $company_id = params[:company_id]
      $company_name = params[:company_name]
    end
    fill
  end

  def add
    
    puts "Superuser:" + params[:suser].to_s
    
    if params[:promis_user] != nil
      params[:promis_user].each do |cu|
        if $array.index(cu) == nil

          puts "adding..." + cu + " with right..." + params[:suser].to_s
          puts params[:suser]
  
          r = Right.new
          r.user_id = cu
          r.company_id = $company_id
          if params[:suser] == "yes"
            r.superuser = true
          else
            r.superuser = false
          end
          r.created_at = Date.today
          r.updated_at = Date.today
          r.save
        end
      end
    end
    fill
  end

  def remove
    if params[:company_user] != nil
      params[:company_user].each do |cu|
        
        puts "deleting..." + cu
        
        Right.where("company_id=? and user_id=?", $company_id, cu).destroy_all
      end
    end
    fill
  end

end