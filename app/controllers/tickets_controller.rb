class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]
  permits :sponsor_id, :ticket_category_id, :name, :description, :amount, :contingent

  # GET /tickets
  def index
    puts params[:sponsor_id]
    @sponsor = Sponsor.find(params[:sponsor_id])
    @tickets = Ticket.where('sponsor_id=?',params[:sponsor_id])
    @ticanz = @tickets.count
  end

  # GET /tickets/1
  def show
  end

  # GET /tickets/new
  def new
    @ticket = Ticket.new
  end

  # GET /tickets/1/edit
  def edit
  end

  # POST /tickets
  def create(ticket)
    @ticket = Ticket.new(ticket)

    if @ticket.save
      redirect_to @ticket, notice: 'Ticket was successfully created.'
    else
      render :new
    end
  end

  # PUT /tickets/1
  def update(ticket)
    if @ticket.update(ticket)
      redirect_to @ticket, notice: 'Ticket was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /tickets/1
  def destroy
    @ticket.destroy

    redirect_to tickets_url, notice: 'Ticket was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket(id)
      @ticket = Ticket.find(id)
    end
end
