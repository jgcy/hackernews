class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |p|
      p.string :first_name
      p.string :last_name
      p.date :birthdate
      p.string :phone_number
      p.integer :user_id
      p.timestamps
    end
  end
end
