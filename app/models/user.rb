class User < ApplicationRecord
  validates :name, presence: true
  validates :postcode, numericality: { only_integer: true }, length: { is: 7 }, allow_nil: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
