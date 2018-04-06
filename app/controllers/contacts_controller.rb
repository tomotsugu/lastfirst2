class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]
  before_action :check_login, only: [:index, :show]

  PER = 5
  def index
    @contacts = Contact.page(params[:page]).per(PER)
    #@contacts = Contact.all
  end

  def show
  end

  def new
    if params[:back]
      @contact = Contact.new(contact_params)
    else
      @contact = Contact.new
      @contact.user_id = 1
      @contact.status = "未読"
    end
  end

  def confirm
    @contact = Contact.new(contact_params)
    #@contact.user_id = 1
    render :new if @contact.invalid?
  end

  def edit
  end

  def complete
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.user_id = 1

    respond_to do |format|
      if @contact.save
        format.html { redirect_to controller: 'contacts', action: 'complete' }
        format.json { render :complete, status: :OK, location: @contact }
        #format.html { redirect_to @contact, notice: 'Contact was successfully created.' }
        #format.json { render :show, status: :created, location: @contact }
      else
        format.html { render :new }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to @contact, notice: 'Contact was successfully updated.' }
        format.json { render :show, status: :ok, location: @contact }
      else
        format.html { render :edit }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_url, notice: 'Contact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_contact
      @contact = Contact.find(params[:id])
    end

    def contact_params
      params.require(:contact).permit(:name, :email, :content, :user_id, :status)
    end

    def check_login
      if !logged_in? 
        redirect_to new_session_path
      end
    end
end
