class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.belongs_to :reservation, null: false
      t.string :street, null: false
      t.string :city, null: false
      t.string :state, default: "Colorado", null: false
      t.string :zip,  null: false
      t.text   :instructions
      t.timestamps
    end
  end
end
