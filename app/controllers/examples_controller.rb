class ExamplesController < ApplicationController
  def create
    @unknown_word = UnknownWord.find(params[:unknown_word_id])
    @example = @unknown_word.examples.build(example_params)
    @example.unknown_word_id = @unknown_word.id
    respond_to do |format|
      if @example.save
        format.turbo_stream do
          flash.now[:success] = "#{@unknown_word.content}に例文を追加"
        end
      else
        format.turbo_stream do
          flash.now[:danger] = "登録できません"
        end
      end
    end
  end

  def destroy
    @example = Example.find(params[:id])
    respond_to do |format|
      if @example.destroy
        format.turbo_stream do
          flash.now[:success] = "例文を削除しました"
        end
      else
        format.turbo_stream do
          flash.now[:danger] = "削除できません"
        end
      end
    end
  end

  private

  def example_params
    params.require(:example).permit(:content, :unknown_word_id)
  end


end
