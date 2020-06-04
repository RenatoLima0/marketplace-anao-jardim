class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
<<<<<<< HEAD
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
=======
  has_many :products, dependent: :destroy
  has_many :orders, dependent: :destroy

  devise :database_authenticatable, :registerable,:recoverable, :rememberable, :validatable
>>>>>>> c7c7fbd27efd2cd7575552c23261e1b3cef72a26
end
