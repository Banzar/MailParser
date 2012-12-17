module HomeHelper
	def account_login
		require 'net/pop'
		pop = Net::POP3.new('pop.gmail.com', 995)

		pop.start(ENV['email'], ENV['password'])

		if imap.mails.empty?
			puts "No new mail!"
		else
			puts "#{pop.mails.length} messages"
		end
	end
end
