class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.string :lastname
      t.string :group
      t.integer :geom
      t.integer :alg
      t.integer :inf
      t.references :winter_session, null: false, foreign_key: true
      t.timestamps
    end
  end
end
