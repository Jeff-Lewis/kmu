class UserLoginController < ApplicationController
  
  $logon_user_id = 0
  $logon_user_name = ""
  $logon_error_message = ""
  $logon_superuser = false
  
  def signin
    @email_tag = "your email adress"
  end

  def login
    
  end

  def logout
    $logon_user_id = 0
    $logon_user_name = ""
    $logon_error_message = ""
    $logon_superuser = false
  end
  
  def verify_login
      @logonuser = User.where("userid=?", params[:userid])
      if @logonuser.count == 0
        $logon_error_message = "email not registered..."
        render :action => "login"
      else
        if @logonuser.first.password == params[:password]
            $logon_user_id = @logonuser.first.id
            $logon_user_name = @logonuser.first.name + " " + @logonuser.first.lastname
            $logon_superuser = true
            redirect_to users_path(:userid => $logon_user_id, :superuser => @logonuser.first.superuser)
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
