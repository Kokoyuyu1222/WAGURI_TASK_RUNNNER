# frozen_string_literal: true

class DeviseCreateConsumers < ActiveRecord::Migration[5.2]
  def change
    create_table :consumers do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      # t.integer  :sign_in_count, default: 0, null: false
      # t.datetime :current_sign_in_at
      # t.datetime :last_sign_in_at
      # t.string   :current_sign_in_ip
      # t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at
      t.string :name
      t.string :first_name
      t.string :last_name
      t.string :kana_first_name
      t.string :kna_last_name
      t.string :phone
      t.integer :gender
      t.integer :age
      t.integer :withdraw, default: 0
      t.integer :postcode
      t.integer :prefecture_code
      t.string :address_city
      t.string :address_street
      t.string :address_building
      t.integer :profile_image_id


      t.timestamps null: false
    end

    add_index :consumers, :email,                unique: true
    add_index :consumers, :reset_password_token, unique: true
    # add_index :consumers, :confirmation_token,   unique: true
    # add_index :consumers, :unlock_token,         unique: true
  end
end