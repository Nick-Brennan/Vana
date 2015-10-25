class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :token
      t.string :strava_id
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :city
      t.string :state
      t.string :profile_img

      t.timestamps null: false
    end
  end
end
