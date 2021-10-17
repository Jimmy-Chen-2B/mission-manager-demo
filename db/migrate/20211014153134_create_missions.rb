class CreateMissions < ActiveRecord::Migration[6.1]
  def change
    create_table :missions do |t|
      t.string :title
      t.text :description
      t.datetime :start_at
      t.datetime :finish_at

      t.timestamps
    end
  end
end
