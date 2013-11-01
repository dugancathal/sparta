class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :id_number
      t.integer :grade_level

    end
  end
end
