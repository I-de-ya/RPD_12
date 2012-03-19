# coding: utf-8
admin_user = User.create :name => 'Максим (админ)', :email => 'maks.rydkin@gmail.com', :password => '123456'
admin_user.toggle!(:admin)
user = User.create :email => 'topmail-topotun@mail.ru',:name => 'Максим', :password => '654321'

themes = Theme.create ([{title: "Исследование плазмодинамических источников излучения высокой спектральной яркости и генераторов сильных ударных волн."},
						{title: "Численное моделирование и теория радиационно-плазмодинамических процессов в вакууме и газах."},
						{title: "Экспериментальные и теоретические исследования радиационно-плазмодинамических процессов взаимодействия теплового и когерентного излучения и сильных ударных волн с веществом различных агрегатных состояний."},
						{title: "Термодинамические и оптические свойства излучающей плазмы."},
						{title: "Радиационно-плазмодинамические процессы и технологии в энергетике, машиностроении, экологии, медицине, квантовой электронике, геофизике и др."}])


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
