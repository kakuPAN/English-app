class UnknownWordsController < ApplicationController
  def index
    @unknown_words = UnknownWord.all
    @meaning = Meaning.new
    @example = Example.new
  end

  def create
    word = Word.find(params[:word_id])
    @unknown_word = UnknownWord.new(content: word.content)
    respond_to do |format|
      if @unknown_word.save
        format.turbo_stream do
          flash.now[:success] = "#{@unknown_word.content}を登録しました"
        end
      else
        format.turbo_stream do
          flash.now[:success] = "単語リストに登録できません"
        end
      end
    end
  end

  def destroy
    @unknown_word = UnknownWord.find(params[:id])
    respond_to do |format|
      if @unknown_word.destroy
        format.turbo_stream do
          flash.now[:success] = "#{@unknown_word.content}を削除しました"
        end
      else
        format.turbo_stream do
          flash.now[:danger] = "削除できません"
        end
      end
    end
  end
end
