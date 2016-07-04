class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :description
      t.string :address
      t.string :phone

      t.timestamps null: false
    end
  end
end
