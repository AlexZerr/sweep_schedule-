class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.string :job_type
      t.datetime :schedule_date, null: false
      t.belongs_to :user, null: false

        t.timestamps

    end
  end
end
