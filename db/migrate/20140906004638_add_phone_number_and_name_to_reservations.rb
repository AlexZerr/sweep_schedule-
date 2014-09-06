class AddPhoneNumberAndNameToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :phone_number, :string, null: false
    add_column :reservations, :supervisor_name, :string, null: false
    add_column :reservations, :instructions, :text
  end
end
