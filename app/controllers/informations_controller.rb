class InformationsController < ApplicationController
  before_action :set_information, only: [:show, :edit, :update, :destroy]
  before_action :check_login, only: [:index, :index_admin , :show, :new, :create]

  def index_admin  #システム管理者
    @informations = Information.all
    render :index
  end

  def index  #user
    @informations = Information.where("destination = '1' and release = '1'")
  end

  def index_visitor #visitor
    @informations = Information.where("destination = '2'")
    render :index
  end

  def show
  end

  def new
    if params[:back]
      @information = Information.new(information_params)
    else
      @information = Information.new
    end

  end

  def confirm
    puts "---------info_confirm"
    @information = Information.new(information_params)
    render :new if @information.invalid?
  end

  def edit
  end

  def create
    @information = Information.new(information_params)

    respond_to do |format|
      if @information.save
        format.html { redirect_to @information, notice: 'information was successfully created.' }
        format.json { render :show, status: :created, location: @information }
      else
        format.html { render :new }
        format.json { render json: @information.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @information.update(information_params)
        format.html { redirect_to @information, notice: 'information was successfully updated.' }
        format.json { render :show, status: :ok, location: @information }
      else
        format.html { render :edit }
        format.json { render json: @information.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @information.destroy
    respond_to do |format|
      format.html { redirect_to informations_url, notice: 'information was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_information
      @information = Information.find(params[:id])
    end

    def information_params
      params.require(:information).permit(:title, :content, :destination, :release)
    end

  def check_login
    if !logged_in? 
      redirect_to new_session_path
    end
  end
end
