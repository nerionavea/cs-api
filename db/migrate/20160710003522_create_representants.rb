class CreateRepresentants < ActiveRecord::Migration
  def change
    create_table :representants do |t|
      t.string :occupation
      t.string :bussines

      t.timestamps null: false
    end
  end
end
