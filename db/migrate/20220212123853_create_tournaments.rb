class CreateTournaments < ActiveRecord::Migration[6.1]
  def change
    create_table :tournaments do |t|
      t.string :name, null: false
      t.integer :mode, null: false
      t.integer :level, null: false, default: 1
      t.text :description
      t.string :place
      t.integer :participants, null: false, default: 0
      t.integer :scenario, null: false, default: 0
      t.integer :status, null: false, default: 0
      t.timestamps
    end
  end
end
