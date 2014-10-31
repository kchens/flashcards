require 'bcrypt'

class User < ActiveRecord::Base
  has_many :scores

  #
  def register(username,password)
    password_salt=BCrypt::Engine.generate_salt
    p password_salt
    password_hash=BCrypt::Engine.hash_secret(password,password_salt)
    User.create(username: username,salt: password_salt, password_hash: password_hash)
    User.all.last
  end

  def authenticate(username,password)
  User.where(username: username).exists?
   if User.where(username: username).exists?
    @user = User.find_by(username: username)
       @user.password_hash == BCrypt::Engine.hash_secret(password, @user[:salt])
      if @user.password_hash == BCrypt::Engine.hash_secret(password, @user[:salt])
        return @user
      end
    end
  end
end