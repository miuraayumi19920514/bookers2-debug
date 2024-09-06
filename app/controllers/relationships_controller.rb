class RelationshipsController < ApplicationController

  
  def create
    user = User.find(params[:user_id])
    relationship = Relationship.new(followed_id: user.id)
    relationship.follower_id = current_user.id
    #favorite = current_user.a_relationships.new(followed_id: user.id)
    relationship.save
    redirect_to request.referer
  end
  
  def destroy
    user = User.find(params[:user_id])
    relationship = current_user.a_relationships.find_by(followed_id: user.id)
    relationship.destroy
    redirect_to request.referer
  end
  
  def follower#自分がフォローしている人の一覧
    user = User.find(params[:user_id])
    @users = user.followings
  end
  
  def followed#自分をフォローしている人の一覧
    user = User.find(params[:user_id])
    @users = user.followers
  end
  
end
