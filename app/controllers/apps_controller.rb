class AppsController < ApplicationController
  before_action :require_user_logged_in

  def new
    @apps = []

    @keyword = params[:keyword]
    if @keyword
      results = ITunesSearchAPI.search(:term => @keyword, :country => "JP", :media => "software").select{ |app| app["primaryGenreName"] == "Games" }

      results.each do |result|
        # 扱い易いように Item としてインスタンスを作成する（保存はしない）
        app = App.find_or_initialize_by(read(result))
        @apps << app
      end
    end
  end

end
