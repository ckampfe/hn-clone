### GET ###

# frontpage
get '/' do
  erb :posts
end

# frontpage
get '/posts' do
  erb :posts
end

# user login page
get '/login' do
  erb :login_user
end

# user create page
get '/users/new' do
  @username_taken = false
  erb :create_user
end

# create post page
get '/posts/new' do
  if session[:user_id]
    erb :post_new
  else
    erb :posts
  end
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

  user = User.where(username: username)

  if user.empty? # NOT IN DATABASE
    u = User.create(params[:user])
    session[:user_id] = u.id
    erb :posts
  else # IN DATABASE
    @username_taken = true
    erb :create_user
  end
end

# login user
post '/login' do
  user = User.where(username: params[:username])[0]
  if !user.nil? && user.password == params[:password]
    session[:user_id] = user.id # log me in
    erb :posts
  else
    @invalid_login = true
    erb :login_user # try again
  end
end

# create post
post '/posts' do
  User.find(session[:user_id]).posts << Post.create(params[:data], :submitter_id => session[:user_id])
  erb :posts
end

# create comment
post '/post/:id' do
  # Comment.create( ... )
  # erb 'posts/:id'
end
