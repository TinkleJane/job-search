class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.string :coursera_id
      t.string :name
      t.string :slug
      t.string :courseType
      t.string :photoUrl
      t.string :instructorIds, :array => true
      t.timestamps
    end

    add_index :courses, :coursera_id
  end
end
