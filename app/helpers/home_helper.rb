module HomeHelper
	def account_login
		require 'net/pop'

		Net::POP3.enable_ssl(OpenSSL::SSL::VERIFY_NONE)  
		connect = Net::POP3.start('pop.gmail.com', 995, ENV["email"],ENV["auth"])
    
		if connect.mails.empty?
			"No new mail!"
		else
			"#{connect.mails.length} new messages. \n"
			
			connect.mails.each do |mail|
			mail.header.split("\r\n").grep(/^From: /)
			end
		end
	 end   
	end
end
