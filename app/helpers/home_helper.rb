module HomeHelper
	def account_login
	require 'net/pop'

		Net::POP3.enable_ssl(OpenSSL::SSL::VERIFY_NONE)  
		Net::POP3.start('pop.gmail.com', 995, ENV["email"], ENV["auth"]) do |pop|

			if pop.mails.empty?
				"No new mail!"
			else
				pop.each_mail do |msg|
					if msg.header.include?('3212165362')
						"#{msg.header}"
						"#{msg.pop}"
					end
				end
			end
		end   
	end
end
