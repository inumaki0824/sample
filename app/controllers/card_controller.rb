class CardController < ApplicationController
    
    # show・edit・updateアクションを呼ぶ前にset_cardメソッドを読む(destroyアクションを追加)
    before_action :set_card, only: %i(show edit update destroy)
    
      # newはインスタンスを作成するメソッドです。 今回は引数に何も入れていないので、空のインスタンスが生成されます。
  def new
    @card = Card.new
    @list = List.find_by(id: params[:list_id])
  end
  
   # permitでtitle, memo, list_idを変更できるように指定しています。
  def create
    @card = Card.new(card_params)
    if @card.save
      redirect_to :root
    else
      render action: :new
    end
  end
  
    def show
    end
  
    def edit
        @lists = List.where(user: current_user)
    end
    
    def update
    if @card.update_attributes(card_params)
      redirect_to :root
    else
      render action: :edit
    end
    end
  
    def destroy
    @card.destroy
    redirect_to :root
    end
  
  private
    def card_params
      params.require(:card).permit(:title, :memo, :list_id)
    end
    
    def set_card
      @card = Card.find_by(id: params[:id])
    end
    
end
