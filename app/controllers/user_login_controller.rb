class UserLoginController < ApplicationController
  
  $logon_user_id = 0
  $logon_user_name = ""
  $logon_error_message = ""
  $logon_superuser = false
  $logon_company_id = ""
  $logon_company_name = ""
  $user_ok = false

  def signin
    @companies = Company.all
    @email_tag = "your email adress"
  end

  def login
    @companies = Company.all
    @comps = Company.all
    @userid = "horst.wurm@bluewin.ch"
    # @userid = "anton.meier@outlook.com"
    @password = "password"
  end

  def logout
    $logon_user_id = 0
    $logon_user_name = ""
    $logon_error_message = ""
    $logon_superuser = false
    $logon_company_id = ""
    $user_ok = false
  end
  
  def verify_login
      @comps = Company.all
      @logonuser = User.where("userid=?", params[:userid])
      
      #check userid
      if @logonuser.count == 0
        $logon_error_message = "email not registered..."
        render :action => "login"
      else

        #check userid
        if @logonuser.first.password == params[:password]
            $logon_user_id = @logonuser.first.id
            $logon_user_name = @logonuser.first.name + " " + @logonuser.first.lastname
            $logon_superuser = @logonuser.first.superuser

            # check companies
            @comps = Company.where("user_id=?",$logon_user_id)
            if @comps.count == 0
              login = true
            end
            if @comps.count == 1
              $logon_company_id = @comps.first.id
              $logon_company_name = @comps.first.name
              login = true
            end
            if @comps.count > 1
              if $user_ok == false
                $logon_error_message = "please select one of your managed companies..."
                $user_ok = true
                @userid = params[:userid]
                @password = params[:password]
                render :action => "login"
              else
                login = true
              end
            end
            if login == true
              # startpage
              redirect_to home_dashboard_path
              # redirect_to workorders_report_path(:user_id => $logon_user_id, :parent_id => 0)
            end

          else
            $logon_error_message = "password not correct..."
            render :action => "login"
        end
      end
  end

  def verify_signin
      @logonuser = User.where("userid=?", params[:userid])
      if @logonuser.count == 0
        if isEmail(params[:userid])
          $logon_error_message = "would open now..."
          redirect_to new_user_path(:mode => "signin", :user_id => params[:userid]) 
        else
          $logon_error_message = "oops this is not a valid eemail adress..."
          render :action => "signin"
        end
      else
        $logon_error_message = "oops email already registered..."
        render :action => "signin"
      end 
  end

  def isEmail(str)
    return str.match(/[a-zA-Z0-9._%]@(?:[a-zA-Z0-9]+\.)[a-zA-Z]{2,4}/)
  end

end
