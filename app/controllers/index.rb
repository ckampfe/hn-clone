### GET ###

# frontpage
get '/' do
  erb :posts
end

# frontpage
get '/posts' do
  erb :posts
end


# wire up login link
# user login page
get '/login' do
  erb :login_user
end

# wire up create account link
# user create page
get '/users/new' do
  @username_taken = false
  erb :create_user
end

# specific post page
get '/posts/:id' do
  @post = Post.find(params[:id])
  @comments = Comment.where("post_id = ?", params[:id])
  erb :post
end

# user profile
get '/users/:id' do
  @user = User.find(params[:id])
  erb :user_profile
end

# user comments profile
get '/users/:id/comments' do
  @user = User.find(params[:id])
  erb :user_comments
end

# user comments profile
get '/users/:id/posts' do
  @user = User.find(params[:id])
  erb :user_posts
end

get '/logout' do
  session.clear
  erb :posts
end


### POST ###

# create user
post '/users' do
  username = params[:user][:username]
  password = params[:user][:password]
  puts username
  puts password


  user = User.where(username: username)

  if user.empty? # NOT IN DATABASE
    u = User.create(params[:user])
    session[:user_id] = u.id
    puts session[:user_id]
    erb :posts
  else # IN DATABASE
    @username_taken = true
    erb :create_user
  end
end

# login user
post '/login' do
  # query for user with login and password
  # store id into session
end

# create post
post '/posts' do
  # Post.create( ... )
  # erb post_new
end

# create comment
post '/post/:id' do
  # Comment.create( ... )
  # erb 'posts/:id'
end
