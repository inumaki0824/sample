class User < ApplicationRecord
    
  # この行を追加
  has_many :lists, dependent: :destroy
    
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    # この1行を追加
    validates :name, presence: true, length: { maximum: 20 }
end
