class UnknownWordsController < ApplicationController
  def index
    @unknown_words = UnknownWord.all
    @meaning = Meaning.new
  end

  def create
    @unknown_word = UnknownWord.new(word_id: params[:word_id])
    # if @unknown_word.save
    #   flash[:success] = "登録！"
    # end
    respond_to do |format|
      if @unknown_word.save
        format.turbo_stream do
          flash.now[:success] = "#{@unknown_word.word.content}を登録しました"
        end
      else
        format.turbo_stream do
          flash.now[:success] = "単語リストに登録できません"
        end
      end
    end
  end
end
