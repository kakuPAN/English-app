class CreateExamples < ActiveRecord::Migration[8.0]
  def change
    create_table :examples do |t|
      t.references :unknown_word, null: false, foreign_key: true
      t.text :content, null: false
      t.timestamps
    end
  end
end
