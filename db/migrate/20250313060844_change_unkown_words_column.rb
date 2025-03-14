class ChangeUnkownWordsColumn < ActiveRecord::Migration[8.0]
  def change
    remove_reference :unknown_words, :word, foreign_key: true
    add_column :unknown_words, :content, :text, null: false
    add_index :unknown_words, :content, unique: true
  end
end
