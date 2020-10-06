class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,               null: false
      t.text :explanatory,          null: false
      t.integer :price,             null: false
      t.integer :category_id,       null: false
      t.integer :status_id,         null: false
      t.integer :fee_id,            null: false
      t.integer :shipmentsource_id, null: false
      t.integer :timerequired_id,   null: false
      t.references :user,           foreign_key: true
      t.timestamps
    end
  end
end
