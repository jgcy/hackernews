class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |s|
      s.string :status_body
      s.integer :user_id
      s.timestamps
    end
  end
end
