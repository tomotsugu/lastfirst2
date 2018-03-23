class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :edit, :update, :destroy]
  before_action :check_login, only: [:index, :show]

  def index
      userid = current_user.id
      puts userid
      # 自保健所あてのものだけ抽出
      @requests = Request.where("user_id IN (?)" , userid)
  end

  def show
  end

  def new
    if params[:back]
      @request = Request.new(request_params)
    else
      @request = Request.new
      @request.user_id = params[:id]
    end
  end

  def confirm
    @request = Request.new(request_params)
    render :new if @request.invalid?
  end

  def edit
  end

  def complete
  end

  def create
    @request = Request.new(request_params)

    respond_to do |format|
      if @request.save
        format.html { redirect_to controller: 'requests', action: 'complete' }
        format.json { render :complete, status: :OK, location: @request }
        #format.html { redirect_to @request, notice: 'request was successfully created.' }
        #format.json { render :show, status: :created, location: @request }
      else
        format.html { render :new }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @request.update(request_params)
        format.html { redirect_to @request, notice: 'request was successfully updated.' }
        format.json { render :show, status: :ok, location: @request }
      else
        format.html { render :edit }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @request.destroy
    respond_to do |format|
      format.html { redirect_to requests_url, notice: 'request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_request
      @request = Request.find(params[:id])
    end

    def request_params
      params.require(:request).permit(:name, :email, :content, :user_id)
    end

    def check_login
      if !logged_in? 
        redirect_to new_session_path
      end
    end

end
