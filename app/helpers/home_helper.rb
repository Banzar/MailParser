module HomeHelper
	def account_login
		require 'net/pop'

		Net::POP.enable_ssl(OpenSSL::SSL::VERIFY_NONE)  
		Net::POP.start('pop.gmail.com', 995, ENV["email"], ENV["auth"]) do |pop|

		if pop.mails.empty?
			"No new mail!"
		else			
			pop.each_mail do |mail|
			"#{mail.header}"
			"#{mail.pop}"
			end
		end
	 end   
	end
end
