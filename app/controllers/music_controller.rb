class MusicController < ApplicationController
  def index
    @user = User.find(session[:user_id])
    @songs = Music.all
  end

  def detail
    @song = Music.find(params[:id])
    @songs = @song.follower.id
    @users = Music.where(follower_id: params[:id])
    @user = User.where(params[:follower_id])
    @songs = @song.follower_id
  end
  def logout
session[:user] = nil
session[:id] = nil
redirect_to '/user/index'
end
def create
  follower = User.find(session[:user_id])
  Music.create(artist: params[:artist], title: params[:title], follower: follower)
  redirect_to "/music/index"
end
def add
  @follower = Library.new(follower_id: session[:user_id])
  @follower.user_id = session[:id]
  @follower.save
  increment! :counter

  redirect_to :back
end

  def counter

end

end
