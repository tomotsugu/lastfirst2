class AddReleaseToInformation < ActiveRecord::Migration[5.1]
  def change
    add_column :information, :release, :string
  end
end
