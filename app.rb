require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require 'sinatra/activerecord'
require './models'

get '/' do
  @items = Item.all
  @categories = Category.all
  erb :index
end

# メモを新しく作成するときの処理
post ‘/create’ do
 Item.create({
 title: params[:title],
 body: params[:body],
 category_id: params[:category]
})
redirect ‘/‘
end

# 特定のメモを編集するときの処理
post ‘edit/:id’ do
 @item = Item.find(params[:id])
 erb :edit
end
# 特定のメモを更新するときの処理
post ‘renew/:id’ do
 @item = Item.find(params[:id])
 @item.update({
  title: params[:title],
  body: params[:body]
 })
redirect ‘/‘
end
# 特定のメモを削除するときの処理
post ‘/delete/:id’ do
 Item.find(params[:id]).destroy
 redirect ‘/‘
end
# メモをカテゴリ分類して表示するときの処理
get ‘/category/:id’ do
 @categories = Category.all
 @cagtegory = Category.find(params[:id])
 @category_name = @category.name
 @items = @category.items
erb :index
end