class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password

      t.timestamps null: false
    end
    add_foreign_key :user, :comments, :articles
  end
end
