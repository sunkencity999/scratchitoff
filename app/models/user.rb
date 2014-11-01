class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

before_create :set_auth_token #implement authorization by token

has_many :lists, dependent: :destroy
has_many :posts, dependent: :destroy
has_many :events, dependent: :destroy

  def role?(base_role)
    role == base_role.to_s
  end
  
  def set_auth_token
    return if auth_token.present? #guard clause
    self.auth_token = generate_auth_token
  end

  def generate_auth_token
    loop do 
      token = SecureRandom.hex #loops until unique token generated
      break token unless self.class.exists?(auth_token: token)
    end
  end

end
