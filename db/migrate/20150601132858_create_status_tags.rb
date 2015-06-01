class CreateStatusTags < ActiveRecord::Migration
  def change
     create_table :status_tags do |st|
      st.integer :status_id
      st.integer :tag_id
      st.timestamps
    end
  end
end
