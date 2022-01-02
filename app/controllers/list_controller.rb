class ListController < ApplicationController
    
  # destroyを追加
  before_action :set_list, only: %i(edit update destroy)
  
  # listコントローラーにnewアクションを作成
  def new
    @list = List.new
  end
  # listコントローラーにcreateアクションを作成
  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to :root
    else
      render action: :new
    end
  end
  
    def set_list
      @list = List.find_by(id: params[:id])
    end

   # find_byは与えられた条件にマッチするレコードのうち最初のレコードだけを返します。
  def edit
      @list = List.find_by(id: params[:id])
  end
  
    # update_attributesメソッドは属性のハッシュを受け取り、成功時には更新と保存を続けて同時に行います。
  def update
      @list = List.find_by(id: params[:id])
    if @list.update(list_params)
      redirect_to :root
    else
      render action: :edit
    end
  end
  
    #ここから追加する
  def destroy
    @list.destroy
    redirect_to :root
  end

  private
    def list_params
      params.require(:list).permit(:title).merge(user: current_user)
    end
    
end
