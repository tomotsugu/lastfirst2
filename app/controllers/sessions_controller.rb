class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      if user.role == "1"
        @user = user
        redirect_to admintops_path
      else
        @user = user
        @post = Post.where("user_id = user.id")
        redirect_to posts_path
      end  
    else
      flash.now[:danger] = 'ログインに失敗しました'
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    #flash[:notice] = 'ログアウトしました'
    #redirect_to new_session_path
    redirect_to root_path
  end

end
