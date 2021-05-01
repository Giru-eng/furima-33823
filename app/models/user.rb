class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: "Include both letters and numbers" }
  validates :nickname, presence: true
  validates :familyname, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "Full-width characters" }
  validates :firstname, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "Full-width characters" }
  validates :familyname_furigana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "Full-width katakana characters" }
  validates :firstname_furigana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "Full-width katakana characters" }
  validates :birthday, presence: true
end
