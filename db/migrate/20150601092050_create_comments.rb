class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |c|
      c.string :comment_body
      c.integer :status_id
      c.integer :user_id
      c.timestamps
    end
  end
end
