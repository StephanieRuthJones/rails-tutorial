class CreateJokes < ActiveRecord::Migration[6.0]
  def change
    create_table :jokes do |t|
      t.string :joke
      t.string :punch
      t.references :dad, null: false, foreign_key: true

      t.timestamps
    end
  end
end
