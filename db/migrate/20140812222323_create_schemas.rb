class CreateSchemas < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, :first_name, :last_name, :phone_number
      t.string :password_digest
      t.integer :organization_id

      t.timestamps
    end

    create_table :organizations do |t|
      t.string :business_name

      t.integer :account_id, :manager_id
      t.timestamps
    end

    create_table :shift_events do |t|
      t.integer :user_id, :event_id
      t.boolean :status
      t.timestamps
    end

    create_table :event do |t|
      t.time :shift_time
      t.date :shift_date
    end

  end
end
