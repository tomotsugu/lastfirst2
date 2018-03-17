class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :manager
      t.string :prefecture
      t.string :city
      t.string :municipality
      t.string :phone
      t.string :role

      t.timestamps
    end
  end
end
