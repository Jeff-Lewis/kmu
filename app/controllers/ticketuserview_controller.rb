class TicketuserviewController < ApplicationController
  def index
    if params[:page]
      session[:page] = params[:page]
    end
    @ticket = Ticket.find(params[:ticket_id])
    @usertickets = UserTicket.where('ticket_id=?',params[:ticket_id]).page(params[:page]).per_page(20)
    @ticanz = @usertickets.count
  end
end
