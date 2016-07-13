class AddSchoolToPeople < ActiveRecord::Migration
  def up
    add_reference :people, :school, index: true, foreign_key: true
  end

  def down
  	remove_column :people, :user_id
  end
end
