# frozen_string_literal: true

class User < ApplicationRecord
  validates :uid, presence: true, uniqueness: { scope: :provider }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[github]
end
