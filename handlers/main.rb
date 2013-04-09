get '/' do
  @items = hn_items
  erb :index
end