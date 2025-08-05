class CreateMysteries < ActiveRecord::Migration[6.1]
  def change
    create_table :mysteries do |t|
      t.string :title
      t.string :location
      t.datetime :date_reported

      t.timestamps
    end
  end
end
