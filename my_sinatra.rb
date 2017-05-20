# запросы API

require 'sinatra'
require 'sinatra/namespace'

require 'sinatra/base'

#new
require 'sequel'
require 'sequel/extensions/seed'
require 'pg'
require 'json'
require 'multi_json'

%w{ controllers models routes }.each{ |dir| Dir.glob("./#{ dir }/*.rb",&method(:require)) }

#подключение к ДБ
DB = Sequel.connect(
    adapter: :postgres,
    database: 'sin_dev',
    host: 'localhost',
    password: 'password',
    user: 'nik',
    max_connections: 10,
# logger: Logger.new('log/db.log')
)






#module MyAppModule
#  class App < Sinatra::Base
#    register Sinatra::Namespace

    get '/' do
      'Hello My Sinatra'
    end

    #переадресация
    get '/redirect' do
      redirect to('/hello/World')
    end

    #можно использовать регвыражения в запросах
    #http://localhost:4567/meta/hello/12345/world
    #http://localhost:4567/meta/hello/world
    get %r{/hello/([\w]+)} do |c|
      "Hello, #{c}!"
    end

    #можно использовать маску 'splat' ( '*' )
    get "/say/*/to/*" do
      params[:splat].to_s # => ["hello" => "world"]
    end

    #Необязательные параметры в шаблонах маршрутов
    get '/jobs.?:format?' do
      #Соответствует
      'Да, работает этот маршрут!'
    end

    get '/hello/:name' do
      "Sinatra приветствует тебя, #{params[:name]}!"
    end

    #get '/*' do
    #  "I don't know what is the #{params[:splat]} It's what you typed"
    #end

#    get '/jobs.?:format?' do
      # соответствует "GET /jobs", "GET /jobs.json", "GET /jobs.xml" и т.д.
 #     ‘Да, работает этот маршрут!’
 #   end

    namespace '/api/v1' do
      get '/*' do
        "I dont find #{params[:splat]} It's what you typed"
      end
    end

#  end
#end
