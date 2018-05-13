class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :full_name
      t.string :email, index: true, unique: true
      t.string :password_digest
      t.string :username, index: true, unique: true
      t.datetime :last_login

      t.timestamps
    end
  end
end
