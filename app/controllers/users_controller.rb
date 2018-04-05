class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :check_login, only: [:index, :show, :new, :create] 

  def index
    @users = User.all
  end

  def new
    @user_role = 1
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to user_path(@user.id)
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end
  
  def edit
    @user_role = session[:user_role]
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      if session[:user_role] == "1"
        redirect_to users_path, notice: "ユーザ情報を更新しました！"
      else
        @post = Post.where("user_id = params[:id]")
        redirect_to posts_path
      end
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation, :manager,
                                 :prefecture, :city, :municipality,
                                 :phone, :role, :lockable)
  end
  def check_login
    if !logged_in? 
      redirect_to new_session_path
    end
  end
end
