class CreatePeriods < ActiveRecord::Migration
  def change
    create_table :periods do |t|
      t.integer :year

      t.timestamps null: false
    end
  end
end
