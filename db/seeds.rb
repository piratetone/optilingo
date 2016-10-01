# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'csv'
require 'rubyXL'

path = "lib/seeds/Spanish_Phrases.xlsx"

# def get_seed_data
# 	list, workbook = [], RubyXL::Parser.parse(path)
# 	worksheet.each do |row|
# 	    english = row.cells[0].value
# 	    spanish = row.cells[1].value
# 	    mp3 = row.cells[2].value

# 	  phrases= {
# 	    english:               	english,
# 	    spanish:              	spanish,
# 	    mp3:    					mp3,
# 	  }
	  
# 	  list << phrases
# end
# puts list
# end

csv_text = File.read(Rails.root.join('lib', 'seeds', 'spanish.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = Phrase.new
  t.english = row['English']
  t.spanish = row['Spanish']
  t.mp3 = row['MP3']
  t.save
  puts "#{t.english}, #{t.spanish} saved"
end

puts "There are now #{Phrase.count} rows in the phrases table"

csv_text = File.read(Rails.root.join('lib', 'seeds', 'spanish-words.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = Word.new
  t.english = row['English']
  t.spanish = row['Spanish']
  t.mp3 = row['MP3']
  t.save
  puts "#{t.english}, #{t.spanish} saved"
end

puts "There are now #{Word.count} rows in the words table"
