# coding: utf-8
admin_user = User.create :name => 'Rydkin Maxim (admin)', :email => 'maks.rydkin@gmail.com', :password => '123456'
admin_user.toggle!(:admin)
user = User.create :email => 'topmail-topotun@mail.ru',:name => 'Максим', :password => '654321'

themes = [{:ru => "Исследование плазмодинамических источников излучения высокой спектральной яркости и генераторов сильных ударных волн.", :en => "The study of plasma dynamics radiation sources of high-spectral brightness and intense shock waves generators."},{:ru => "Численное моделирование и теория радиационно-плазмодинамических процессов в вакууме и газах.", :en => "Numerical simulation and the theory of radiation-plasmodynamic processes in vacuum and gases theory."},{:ru => "Экспериментальные и теоретические исследования радиационно-плазмодинамических процессов взаимодействия теплового и когерентного излучения и сильных ударных волн с веществом различных агрегатных состояний.", :en => "Experimental and theoretical investigation radiation-plasmodynamic processes of interaction heat and coherent radiation and intense shock waves with different aggregate states matter."},{:ru => "Термодинамические и оптические свойства излучающей плазмы.", :en => "Thermodynamic and optical properties of the emitting plasma."},{:ru => "Радиационно-плазмодинамические процессы и технологии в энергетике, машиностроении, экологии, медицине, квантовой электронике, геофизике и др.", :en => "Radiation-plasmodynamic processes and technologies in power industry, mechanical engineering, ecology, medicine, quantum electronics, geophysics, etc."}]

themes.each_index do |i|
	I18n.locale = 'ru'
	theme = Theme.new :title => themes[i][:ru]
	I18n.locale = 'en'
	theme.title = themes[i][:en]
	theme.save
end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)