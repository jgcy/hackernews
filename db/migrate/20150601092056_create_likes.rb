class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |l|
      l.boolean :liked
      l.timestamps
    end
  end
end
