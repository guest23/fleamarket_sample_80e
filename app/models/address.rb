class Address < ApplicationRecord
  belongs_to :user, optional: true
  validates :address_first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "全角のみで入力して下さい" }
  validates :address_family_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "全角のみで入力して下さい" }
  validates :address_first_name_kana, presence: true, format: { with: /\p{hiragana}/, message: "ひらがなのみで入力して下さい" }
  validates :address_family_name_kana, presence: true, format: { with: /\p{hiragana}/, message: "ひらがなのみで入力して下さい" }
  validates :post_code, presence: true, format: { with: /^\d{7}$/, multiline: true, message: "ハイフンなし7桁"}
  validates :prefecture_code,:city, :house_number, presence: true
end
