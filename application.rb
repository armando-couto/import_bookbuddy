require 'csv'
require 'json'
require 'bundler/inline'

gemfile do
  source 'https://rubygems.org'
  gem 'mysql2', '~> 0.5.4'
end

puts "Começando a Importar!"

data = CSV.read("BookBuddy.csv")

data.each do |item|
  puts item
end

begin
  client = Mysql2::Client.new(:host => "localhost", :username => "root", :password => "root", :database => "biblioteca")

  client.query("SELECT * FROM books;").each do |row|
    puts row
  end

  client.query("SELECT * FROM indexes;").each do |row|
    puts row
  end

rescue Mysql2::Error => e
  puts e.errno
  puts e.error

ensure
  client.close if client
end