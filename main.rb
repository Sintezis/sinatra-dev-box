class MainController < Sinatra::Base 

	get '/' do
		redirect '/index.html'
	end
	
end
