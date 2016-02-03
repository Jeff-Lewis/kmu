class LoginController < ApplicationController

$current_user_id = 0

def index
end

def login
    if params[:login_email]
    str="userid="+"'"+params[:login_email]+"'"
    @logonuser = User.where(str)
    if @logonuser.count == 0
        @email = params[:email]
        @password = params[:password]
        @logonuser = nil
    else
        if @logonuser.first.password == params[:password]  
            @username = @logonuser.first.name + " " + @logonuser.first.lastname
            $current_user_id = @logonuser.first.id
            redirect_to workorders_path(:parent_id => 0, :user_id => $current_user_id, :mode => "bookable")
        end
    end
    end
end

end
