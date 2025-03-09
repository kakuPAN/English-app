class WordsController < ApplicationController
  def show
    sentence = Sentence.find(params[:id])
    words = Word.where(sentence_id: sentence.id).order(:position)
  end
end
