class CreateUnknownWords < ActiveRecord::Migration[8.0]
  def change
    create_table :unknown_words do |t|
      t.references :word, null: false, foreign_key: true
      t.timestamps
    end
  end
end
