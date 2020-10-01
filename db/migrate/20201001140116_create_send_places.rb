class CreateSendPlaces < ActiveRecord::Migration[6.0]
  def change
    create_table :send_places do |t|
      t.string :postalcode,     null: false
      t.integer :prefecture_id, null: false
      t.string :municipality,   null: false
      t.string :homeadress,     null: false
      t.string :building
      t.string :phonenumber,    null: false
      t.references :order,      foreign_key: true
      t.timestamps
    end
  end
end
