module HomeHelper
	def account_login
		require 'net/pop'

		Net::POP.enable_ssl(OpenSSL::SSL::VERIFY_NONE)  
		Net::POP.start('pop.gmail.com', 995, ENV["email"], ENV["auth"]) do |pop|

		if pop.mails.empty?
			"No new mail!"
		else
			"#{pop.mails.length} new messages"
			
			pop.mails.each do |mail|
			mail.inspect
			end
		end
	 end   
	end
end
