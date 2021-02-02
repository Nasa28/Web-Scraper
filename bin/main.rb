require_relative '../lib/scraper'

puts '===== Welcome to my scraper.====='.green
puts 'To continue press y'.blue

repeat = false
while repeat == false
  input = gets.chomp
  if input == 'y'
    repeat = true
    my_item = Scraper.new
    puts my_item.scraper
  else
    puts 'Put y to continue '.red
  end
end
