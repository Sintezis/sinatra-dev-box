class WebController < Sinatra::Base
	enable :method_override

	get '/' do
  	"Hello! I'm your sinatra development box"
	end

end


