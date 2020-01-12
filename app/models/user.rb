class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :deli_addresses, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :carts, dependent: :destroy

  acts_as_paranoid

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