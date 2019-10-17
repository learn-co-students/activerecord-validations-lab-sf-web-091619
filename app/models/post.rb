class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    validate :clickbaity?

    def clickbaity?
       if !title.nil? && (!title.include?("Won't Believe" || "Secret" || "Guess" || "Top"))
        errors.add(:clickbait, "Not clickbait-y enough")
       end
    end
end



