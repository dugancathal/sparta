class CreateIdentities < ActiveRecord::Migration
  def change
    create_table :identities do |t|
      t.string :username, uniq: true, index: true
      t.string :password_digest
      t.string :first_name
      t.string :last_name
      t.boolean :admin, default: false

      t.timestamps
    end
  end
end
