class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :number,         null:false
      t.integer :area_id,       null:false
      t.string :town,           null:false
      t.string :banchi,       null:false
      t.string :building
      t.string :phone,       null:false
      t.references :buy, null: false, foreign_key: true


      t.timestamps
    end
  end
end
