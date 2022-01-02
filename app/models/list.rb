class List < ApplicationRecord
    
  # UserモデルとListモデルのアソシエーション設定
  belongs_to :user
  
    # has_manyは、他のモデルとの間に「1対多」のつながりがあることを示します。
  has_many :cards, dependent: :destroy
  
  # リストのタイトルの文字数が1文字以上255文字以下であるかどうかを検証するバリデーションを追加。lengthは属性の値の長さを検証するメソッドです。
  validates :title, length: { in: 1..255 }
    
end
