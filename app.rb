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

# 特定のメモを更新するときの処理

# 特定のメモを削除するときの処理

# メモをカテゴリ分類して表示するときの処理
