class CreateRelApps < ActiveRecord::Migration[5.0]
  def change
    create_table :rel_apps do |t|
      t.references :user, foreign_key: true
      t.references :app, foreign_key: true

      t.timestamps
      t.index [:user_id, :app_id], unique: true
    end
  end
end
