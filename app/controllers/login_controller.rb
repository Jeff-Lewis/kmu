class LoginController < ApplicationController

def index
    @email=""
    @password=""
    @username=""
end

def login
if params[:email]
    str="userid="+"'"+params[:email]+"'"
    @logonuser = User.where(str)
    if @logonuser.count == 0
        @email = params[:email]
        @password = params[:password]
        @username= ""
    else
        if @logonuser.first.password == params[:password]  
            @username = @logonuser.first.name + " " + @logonuser.first.lastname
            redirect_to users_url
        end
    end
end
end

end
