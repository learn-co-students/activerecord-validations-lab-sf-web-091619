class Post < ActiveRecord::Base
	validates :title, presence: true 
	validates :content, length: { minimum: 250 }
	validates :summary, length: { maximum: 250 }
	validates :category, inclusion: { in: ["Fiction", "Non-Fiction"] }
	validate :nobait
	def nobait
		binding.pry
		bait = [/Won't Believe/i, /Secret/i, /Top/i, /Guess/i]
		#binding.pry
		if bait.none? { |b| b.match title }
			errors.add(:title, "CLICKBAIT DETECTED")
		end
	end
end