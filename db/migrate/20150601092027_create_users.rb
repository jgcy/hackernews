class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |u|
      u.string :email
      u.string :password
      u.timestamps
    end
  end
end
