class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :clinics
  has_many :announcements
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.username = "ゲストユーザ"
      # 例えば name を入力必須としているならば， user.name = "ゲスト" なども必要
    end
  end
  
end
