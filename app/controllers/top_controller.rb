class TopController < ApplicationController
    def index
        #List.where(user: current_user)と描いてあげることで、user_idが現在ログインしているユーザー(current_user)のレコードを取得します。
        @lists = List.where(user: current_user).order("created_at ASC")
    end
end
