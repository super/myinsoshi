class User < ActiveRecord::Base
  validates_length_of :username, :within => 3..16
  validates_presence_of :username, :email
  validates_uniqueness_of :username, :email
  validates_format_of :email,  :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  attr_accessor :password_confirmation
  validates_confirmation_of :password
  def current_password
    @current_password
  end
  def password
    @password
  end
  def password= (pwd)
    @password = pwd
    return if @password.blank?
    create_salt
    self.hashed_password = User.encrypt_password(self.password,self.salt)
  end
  def self.authenticate(email,password)
    if @user = User.find_by_email(email)
      if @user.hashed_password == encrypt_password(password,@user.salt)
        @user
      else
        return nil
      end
    end
  end
  def self.change_password(current_password,password)
    if self.hashed_password==encrypt_password(current_password,self.salt)
      if self.password=password
        @user
      else
        errors.add("密码不一致")
      end
    else
      errors.add("当前密码输入错误")
      false
    end
  end
  private
  def create_salt
    self.salt = self.object_id.to_s + "successed" + rand.to_s
  end
  def self.encrypt_password(password,salt)
    string_to_hash = password + salt
    Digest::SHA1.hexdigest(string_to_hash)
  end
end
