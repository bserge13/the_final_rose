class CreateOutings < ActiveRecord::Migration[7.1]
  def change
    create_table :outings do |t|
      t.string :event
      t.string :location
      t.string :date

      t.timestamps
    end
  end
end
