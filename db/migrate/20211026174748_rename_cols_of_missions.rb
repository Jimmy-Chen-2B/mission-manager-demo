class RenameColsOfMissions < ActiveRecord::Migration[6.1]
  def change
    rename_column(:missions, :start_at, :started_at)
    rename_column(:missions, :finish_at, :finished_at)
  end
end
