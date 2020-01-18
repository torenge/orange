class Order < ApplicationRecord
	belongs_to :user
	has_many :order_products, dependent: :destroy
  accepts_nested_attributes_for :order_products
	has_many :deli_address

	accepts_nested_attributes_for :order_products

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
