class RemoveReleaseToInformation < ActiveRecord::Migration[5.1]
  def change
    remove_column :information, :release, :boolean
  end
end
