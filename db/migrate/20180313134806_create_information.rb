class CreateInformation < ActiveRecord::Migration[5.1]
  def change
    create_table :information do |t|
      t.string :title
      t.string :content
      t.string :destination
      t.boolean :release

      t.timestamps
    end
  end
end
