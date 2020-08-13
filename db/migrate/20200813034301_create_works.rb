class CreateWorks < ActiveRecord::Migration[5.2]
  def change
    create_table :works do |t|
      t.string :name
      t.text :student_names
      t.integer :enroll_year
      t.integer :major
      t.integer :category
      t.integer :client_type

      t.timestamps
    end
  end
end
