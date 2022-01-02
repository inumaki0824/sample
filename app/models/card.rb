class Card < ApplicationRecord
    belongs_to :list
      # lengthは属性の値の長さを検証するメソッドです。
  validates :title, length: { in: 1..255 }
  validates :memo,  length: { maximum: 1000 }
end
