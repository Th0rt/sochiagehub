class CreateFriendcodes < ActiveRecord::Migration[5.0]
  def change
    create_table :friendcodes do |t|
      t.references :user, foreign_key: true
      t.references :app, foreign_key: true
      t.string :friendcode

      t.timestamps
      t.index [:user_id, :app_id], unique: true
    end
  end
end
