class CreateMeasPayloads < ActiveRecord::Migration
  def change
    create_table :meas_payloads do |t|
      t.string :site
      t.string :name
      t.float :value

      t.timestamps null: false
    end
  end
end
