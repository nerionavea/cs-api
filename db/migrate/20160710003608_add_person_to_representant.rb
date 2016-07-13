class AddPersonToRepresentant < ActiveRecord::Migration
  def change
    add_reference :representants, :people, index: true, foreign_key: true
  end
end
