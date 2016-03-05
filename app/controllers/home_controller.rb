class HomeController < ApplicationController

def index
  @workorders=Workorder.all
end

def dashboard
  @workorders=Workorder.all
end

end
