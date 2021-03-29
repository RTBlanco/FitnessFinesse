Fitness App

(models)
Post    #Join table joining categories & users
    - belongs_to :user
    - has_many :comments
    - has_many :users, through :comments
    - belongs_to :category
    - title
    - content



User
    - has_many :posts
    - has_many :comments
    - has_many :commented_posts, through :comments
    - has_many :categories, through :posts
    - username
    - email
    - password_digest


Comment * join table joining users and posts
    - belongs_to :user
    - belongs_to :post
    - content


Categories
    - name
    - has_many :posts




<!-- The code in users_controller - url:'/signup' just means that it will re-render the new page so that itll have the Signup url instead of the user url -->


<!-- For "signup link in sessions "Home page" you can use this alternate coee instead ------ <a href="/signup">Sign Up Here</a>