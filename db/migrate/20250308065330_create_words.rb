class CreateWords < ActiveRecord::Migration[8.0]
  def change
    create_table :words do |t|
      t.references :sentence, null: false, foreign_key: true
      t.text :content, null: false
      t.integer :position, null: false
      t.timestamps
    end
  end
end
