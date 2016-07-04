class AddSchoolToPeriod < ActiveRecord::Migration
  def change
    add_reference :periods, :school, index: true, foreign_key: true
  end
end
