class CreatePostvotes < ActiveRecord::Migration
  def change
      create_table :postvotes do |c|
      c.integer :user_id
      c.integer :post_id
      c.timestamps
    end
  end
end
