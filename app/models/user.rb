# frozen_string_literal: true

class User < ApplicationRecord
  validates :name, presence: true
  validates :postcode, numericality: { only_integer: true }, length: { is: 7 }, allow_nil: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
