class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :names
      t.string :last_names
      t.integer :ci
      t.string :place_birth
      t.date :birth
      t.string :address
      t.string :sex

      t.timestamps null: false
    end
  end
end
