module HomeHelper
	def account_login
		require 'net/imap'

		Net::IMAP.enable_ssl(OpenSSL::SSL::VERIFY_NONE)  
		Net::IMAP.login('imap.gmail.com', 993, ENV["email"],ENV["auth"]) do |connect|
    
		if connect.mails.empty?
			"No new mail!"
		else
			"#{connect.mails.length} new messages"
			
			connect.each_mail do |mail|
			mail.header.split("\r\n").grep(/^From: /)
			end
		end
	 end   
	end
end
