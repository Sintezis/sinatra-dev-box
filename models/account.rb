class Account 
	include DataMapper::Resource

	property :id, 				Serial
  property :name, 			String,  :length => 255
  property :email, 		  String,  :length => 255, :unique => true, :format => :email_address
  property :created_at, DateTime
	property :created_on, Date   
	property :updated_at, DateTime
  property :updated_on, Date

  belongs_to :user
end