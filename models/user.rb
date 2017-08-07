class User
  include DataMapper::Resource

  property :id, 					 Serial
  property :email, 				 String,   :length => 255, :unique => true, :format => :email_address
  property :password, 		 String,   :length => 255
  property :token, 				 String,   :length => 255
  property :recover_code,  String,   :length => 255
  property :created_at, 	 DateTime
	property :created_on, 	 Date   
	property :updated_at, 	 DateTime
  property :updated_on, 	 Date

  has n, :accounts
  has n, :hostings
  has n, :attendings
  has n, :events, :through => :hostings
  has n, :events, :through => :attendings
  
end