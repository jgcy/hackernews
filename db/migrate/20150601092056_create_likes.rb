class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |l|
      l.boolean :liked
      l.integer :user_id
      l.integer :status_id
      l.timestamps
    end
  end
end
