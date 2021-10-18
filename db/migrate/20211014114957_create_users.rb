class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :password_digest

      t.timestamps
    end

    add_column :users, :password_reset_token, :string

    # add next line if you want it to be expirable
    add_column :users, :password_reset_token_created_at, :datetime
  end
end
