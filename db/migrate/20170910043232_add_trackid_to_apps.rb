class AddTrackidToApps < ActiveRecord::Migration[5.0]
  def change
    add_column :apps, :trackid, :string
  end
end
