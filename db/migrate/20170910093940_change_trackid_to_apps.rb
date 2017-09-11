class ChangeTrackidToApps < ActiveRecord::Migration[5.0]
  #変更後の型
  def up
    change_column :apps, :trackid, 'integer USING CAST(column_name AS integer)', null: false
  end

  #変更前の型
  def down
    change_column :apps, :trackid, :string, null: true
  end
end
