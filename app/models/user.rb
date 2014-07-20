class User < ActiveRecord::Base
	has_many :rounds
	has_many :decks

  validates :email, :password, :name, presence: true
  validates_uniqueness_of :email, :message => "address already exists.  Try again."

	include BCrypt #a module

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(email,password)
  	user = User.find_by_email(email)
  	if user && user.password == password
  		user
  	else
  		nil
  	end
  end

  

end
