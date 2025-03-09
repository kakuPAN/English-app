class MeaningsController < ApplicationController
  def create
    @unknown_word = UnknownWord.find(params[:unknown_word_id])
    @meaning = @unknown_word.meanings.build(meaning_params)
    @meaning.unknown_word_id = @unknown_word.id
    respond_to do |format|
      if @meaning.save
        format.turbo_stream do
          flash.now[:success] = "#{@meaning.content}を登録"
        end
      else
        format.turbo_stream do
          flash.now[:danger] = "登録できません"
        end
      end
    end
  end

  def destroy
    @meaning = Meaning.find(params[:id])
    respond_to do |format|
      if @meaning.destroy
        format.turbo_stream do
          flash.now[:success] = "#{@meaning.content}を削除しました"
        end
      else
        format.turbo_stream do
          flash.now[:danger] = "削除できません"
        end
      end
    end
  end

  private

  def meaning_params
    params.require(:meaning).permit(:content, :unknown_word_id)
  end
end

