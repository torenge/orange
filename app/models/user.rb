class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
             :recoverable, :rememberable, :validatable

  has_many :deli_addresses
  has_many :orders
  has_many :carts

  acts_as_paranoid

  validates :kana_first_name, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'カタカナで入力して下さい。'}
  validates :kana_last_name, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'カタカナで入力して下さい。'}
  validates :tel_num, presence: true, format: { with: /\A\d{10,11}\z/, message: ' ハイフン無しの半角数字、10桁or11桁で入力してください' }
  validates :postal_code, format: {with: /\A\d{7}\z/, message: ' ハイフン無しの半角数字、7桁で入力してください' }
  validates :address, presence: true
  validates :deleted_at, inclusion:{in: [true, false]}
  composed_of :fullname,
                  :class_name => "FullName",
                  :mapping => [
                      [ :first_name, :family_name ],
                      [ :last_name, :given_name ]
                    ]
  composed_of :kana_fullname,
                  :class_name => "Kana_FullName",
                  :mapping => [
                      [ :kana_first_name, :family_name ],
                      [ :kana_last_name, :given_name ]
                    ]
end

class FullName

  attr_reader :family_name, :given_name

      def initialize(family_name, given_name)
        @family_name = family_name
        @given_name = given_name
      end

      def to_s
        [@family_name, @given_name].compact.join(" ")
      end

  end


    class Kana_FullName
      attr_reader :family_name, :given_name

      def initialize(family_name, given_name)
        @family_name = family_name
        @given_name = given_name
      end

      def to_s
        [@family_name, @given_name].compact.join(" ")
      end

    end