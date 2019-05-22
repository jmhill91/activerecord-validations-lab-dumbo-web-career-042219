class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
   validate :not_nil_and_clickbait_title



   def not_nil_and_clickbait_title
     if title != nil
       self.clickbait_title
     else
       "you have no title"
     end
   end

  def clickbait_title
    unless title.include?("Won't Believe") ||  title.include?("Secret") || title.include?("Top[number]") || title.include?("Guess")
      errors.add(:title, "must be clickbaity")
    end
  end
end
