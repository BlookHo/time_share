class CreateApartments < ActiveRecord::Migration[5.1]
  def change
    create_table :apartments do |t|
      t.string :type
      t.string :description
      t.references :resort, foreign_key: true

      t.timestamps
    end
  end
end
