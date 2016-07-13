class RemoveUserToPeople < ActiveRecord::Migration
  def change
  	remove_reference :people, :user
  end
end
