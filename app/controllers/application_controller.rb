class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include SessionsHelper

  private

  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end

  def read(result)
    trackid = result['trackId']
    name = result['trackName']
    image_url = result['artworkUrl100']

    return {
      name: name,
      image_url: image_url,
      trackid: trackid
    }
  end
  
end