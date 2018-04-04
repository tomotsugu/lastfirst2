class ChangeColumnToInfromation < ActiveRecord::Migration[5.1]

  def change
    remove_column(:information, :release)
  end  
end

