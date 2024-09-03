class RelationshipsController < ApplicationController
  def index
  end
  
  def create
    @user = User.find(params[:user_id])#follower_idとかじゃなくていいか？
    
  end
  
  def destroy
    
  end
  
end
