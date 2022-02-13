# frozen_string_literal: true

class User < ActiveRecord::Base
  include Authorship
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User

  enum role: %i[basic admin], _suffix: :role

  def author?(obj)
    obj.user == self
  end
end
