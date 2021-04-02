class User < ApplicationRecord
    has_many :posts                               # Posts that I wrote
    #has_many :categories, through :posts         #The Join table would be categories
    has_many :comments    # This is a comment I wrote on someone elses post about something and now that I have a comment, its a "commented post"
    has_many :commented_posts, through: :comments, source: :post
    has_secure_password     #gives us access to the .authenticate method, built in validations for passwords/password confirmation
    #has_many :authors, through :post
end


# Nested Routes
# new, show, or index
# '/users'
# '/users/:id/posts'
# '/posts'
# '/posts/:id/comments'

