class AccessesController < ApplicationController
  before_action :set_access, only: [:show, :edit, :update, :destroy]
  permits :user_id, :workorder_id, :access, :costrate

  $workorder_id =""
  $workorder_name = ""
  $array = []
  $suser = false

  def fill
    accesses = Access.where("workorder_id=?", $workorder_id)
    $array = []
    accesses.each do |a|
        $array << a.user_id.to_s
    end
    @w_user = User.where(:id => $array).order(:name)
    @c_user = User.all.order(:name)
  end

  def index
    @c_user = User.all.order(:name)
    if params[:workorder_id] != nil
      $workorder_id = params[:workorder_id]
      $workorder_name = params[:workorder_name]
    end
    fill
  end

  def add
    if params[:company_user] != nil
      params[:company_user].each do |cu|
        if $array.index(cu) == nil
          a = Access.new
          a.user_id = cu
          a.workorder_id = $workorder_id
          tu = User.find(cu)
          if tu != nil
            cr = tu.costrate
          else
            cr = 0
          end
          a.costrate = cr
          a.created_at = Date.today
          a.updated_at = Date.today
          a.save
        end
      end
    end
    fill
  end

  def remove
    if params[:workorder_user] != nil
      params[:workorder_user].each do |cu|
        Access.where("workorder_id=? and user_id=?", $workorder_id, cu).destroy_all
      end
    end
    fill
  end
end