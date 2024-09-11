class SearchesController < ApplicationController
  before_action :search

  #def search
    #@p = User.ransack(params[:q])
   # @user = @p.result
  #end


  def search
    puts params#これでパラムスの中を調べられる、アプリケーションでサーチアクション（検索）をして、ターミナルを見る
    if params[:query].present? && params[:category].present?
      if params[:category] == 'user'
        @results = User.where('name LIKE ?', "%#{params[:query]}%")
      elsif params[:category] == 'book'
        @results = Book.where('title LIKE ?', "%#{params[:query]}%")
      end
    else
      @results = []
    end
  end

end
