module HomeHelper
	def account_login
		require 'net/imap'
		imap = Net::IMAP.new('imap.gmail.com', 993)

		imap.login(ENV['email'], ENV['password'])

		if imap.mails.empty?
			puts "No new mail!"
		else
			puts "#{imap.mails.length} messages"
		end
	end
end
