class SentencesController < ApplicationController
  def index
    @sentences = Sentence.all
  end

  def new
    @sentence = Sentence.new
  end

  def create
    @sentence = Sentence.new(sentence_params)
    if @sentence.save
      save_words(@sentence)
      flash[:success] = "英文を保存しました"
      redirect_to sentences_path
    else
      flash.now[:danger] = "保存できません"
      render :new
    end
  end

  def show
    sentence = Sentence.find(params[:id])
    @words = Word.where(sentence_id: sentence.id).order(:position)
  end

  private

  def sentence_params
    params.require(:sentence).permit(:content)
  end

  def save_words(sentence)
    # 文章を単語ごとに分割
    words = sentence.content.scan(/[\w'-]+|[.,!?;]/)

    # 単語を順番に保存
    words.each_with_index do |word, index|
      Word.create!(sentence_id: sentence.id, content: word, position: index)
    end
  end
end
