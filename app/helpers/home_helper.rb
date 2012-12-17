module HomeHelper
	def account_login
		require 'net/pop'

		Net::POP3.enable_ssl(OpenSSL::SSL::VERIFY_NONE)  
		Net::POP3.start('pop.gmail.com', 995, ENV["email"],ENV["auth"]) do |pop|    
		if pop.mails.empty?
			puts "No new mail!"
		else
			puts "#{pop.mails.length} messages"
		end
	 end   
	end
end
