class CreateCommentvotes < ActiveRecord::Migration
  def change
      create_table :commentvotes do |c|
      c.integer :user_id
      c.integer :comment_id
      c.timestamps
    end
  end
end
