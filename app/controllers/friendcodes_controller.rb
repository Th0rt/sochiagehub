class FriendcodesController < ApplicationController
  def show
    @friendcode = current_user.friendcodes.first
  end
  
  def new
  end
  
  def create
    @friendcode = []
    @app = App.find(params[:app_id])
    current_user.input_friendcode(@app,params[:friendcode])
    flash[:success] = 'フレンドコードを登録しました'
    redirect_to :back
  end

  def update
    @app = App.find(params[:app_id])
    current_user.update_friendcode(@app,params[:friendcode][:friendcode])
    flash[:success] = 'フレンドコードを変更しました'
    redirect_to :back
  end
  
end
