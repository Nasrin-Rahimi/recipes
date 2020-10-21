class User < ActiveRecord::Base
    has_secure_password
    has_many :recipes

    validates_presence_of :username, :email, :message  => "can’t be blank"
   
end