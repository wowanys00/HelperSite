class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
        has_attached_file :avatar, styles: { medium: "300x300>" }, default_url: "/assets/missing.jpg"
    validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

    has_many :works

    has_many :conversations, :foreign_key => :sender_id
end
