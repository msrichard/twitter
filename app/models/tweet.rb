class Tweet < ActiveRecord::Base
	belongs_to :user

	validates :content, length: {maximum: 5}

	after_create :email_user

	def email_user
		TweetMailer.alert_user_about_tweet(self).deliver
	end
end
