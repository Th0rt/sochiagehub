class RelAppsController < ApplicationController
  def create
    @app = App.find_or_initialize_by(trackid: params[:trackid])
    
    unless @app.persisted?
      results = ITunesSearchAPI.lookup(:id => @app.trackid, :country => 'jp')
      @app = App.new(read(results))
      @app.save
    end
    current_user.have(@app)
    redirect_to user_path(current_user)
  end

  def destroy
    @app = App.find(params[:app_id])
    current_user.unhave(@app)
    redirect_to user_path(current_user)
  end
end
