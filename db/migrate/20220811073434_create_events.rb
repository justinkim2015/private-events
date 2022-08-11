class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.timestamp :date
      t.string :place

      t.timestamps
    end
  end
end
