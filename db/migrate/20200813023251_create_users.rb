class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :password_digest
      t.string :recovery_password_digest
      t.string :login

      t.timestamps
    end
  end
end
