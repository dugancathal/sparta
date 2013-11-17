class CreateIdentities < ActiveRecord::Migration
  def change
    create_table :identities do |t|
      t.string :username, uniq: true, index: true
      t.string :password_digest
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :gender
      t.datetime :birthday
      t.string :email
      t.boolean :admin, default: false

      t.timestamps
    end
  end
end
