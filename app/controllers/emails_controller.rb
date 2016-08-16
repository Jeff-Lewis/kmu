class EmailsController < ApplicationController
  before_action :set_email, only: [:show, :edit, :update, :destroy]
  permits :header, :body, :m_from, :m_to, :status, :back_url

  # GET /emails
  def index
    @emails = Email.all
  end

  # GET /emails/1
  def show
  end

  # GET /emails/new
  def new
    @email = Email.new
    @email.m_from = params[:m_from_id]
    @email.m_to = params[:m_to_id]
    @email.header = params[:header]
    @email.body = params[:body]
    @email.status = "ready_to_send"
    @email.back_url = params[:back_url]
  end

  # GET /emails/1/edit
  def edit
  end

  # POST /emails
  def create(email)
    @email = Email.new(email)
    if @email.save
      redirect_to @email.back_url, notice: 'Email was successfully created.'
    else
      render :new
    end
  end

  # PUT /emails/1
  def update(email)
    if @email.update(email)
      redirect_to @email.back_url, notice: 'Email was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /emails/1
  def destroy
    @email.destroy
    redirect_to emails_url, notice: 'Email was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_email(id)
      @email = Email.find(id)
    end
end
