get '/' do
  @items = get_hn
  erb :index
end