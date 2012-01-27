# coding: utf-8
admin_user = User.create :name => 'Максим (админ)', :email => 'maks.rydkin@gmail.com', :password => '123456'
admin_user.toggle!(:admin)
user = User.create :email => 'topmail-topotun@mail.ru',:name => 'Максим', :password => '654321'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
