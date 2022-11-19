class CreateWinterSessions < ActiveRecord::Migration[7.0]
  def change
    create_table :winter_sessions do |t|
      t.integer :year
      t.timestamps
    end
  end
end
