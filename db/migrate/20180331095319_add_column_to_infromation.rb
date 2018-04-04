class AddColumnToInfromation < ActiveRecord::Migration[5.1]
  def change
    add_column(:information, :release, :integer, :limit => 1)
  end
end
