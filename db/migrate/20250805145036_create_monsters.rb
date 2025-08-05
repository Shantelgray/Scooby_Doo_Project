class CreateMonsters < ActiveRecord::Migration[6.1]
  def change
    create_table :monster do |t|
      t.string :name
      t.string :disguise_as
      t.references :mystery, null:false, foreign_key: true

      t.timestamps
  end
end
