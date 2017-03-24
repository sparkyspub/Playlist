class UserController < ApplicationController
  def index
  end
  def create
    @user = User.create(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/music/index'
    else
      flash[:message] = ["Incorrect Registration"]
      redirect_to :back
    end
  end
  def login
    @user = User.find_by(email: params[:email])
    if @user
      session[:user_id] = @user.id
      redirect_to '/music/index'
    else
      flash[:message] = ["Incorrect Login"]
      redirect_to '/user/index'
    end
  end
  def edit
    @user = User.find(session[:user_id])
  end
  def update_user
    @user = User.find(session[:user_id])
    @user.first_name = params[:first_name]
    @user.last_name = params[:last_name]
    @user.email = params[:email]
    @user.save
    redirect_to '/music/index'

  end
  def profile
    @songs = Music.where(follower_id: params[:id])
    @user = User.where(follower_id: params[:id])




  end
end
