class User < ApplicationRecord
    has_many :posts                               # Posts that I wrote
    #has_many :categories, through :posts         #The Join table would be categories
    
    has_many :comments    # This is a comment I wrote on someone elses post about something and now that I have a comment, its a "commented post"
    has_many :commented_posts, through :comments,
        source :post

    #has_many :authors, through :post
end
