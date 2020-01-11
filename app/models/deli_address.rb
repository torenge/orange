class DeliAddress < ApplicationRecord

	has_many :orders

	belongs_to :user

  acts_as_paranoid

	   composed_of :fullname,
              :class_name => "FullName",
              :mapping => [
                  [ :first_name, :family_name ],
                  [ :last_name, :given_name ]
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