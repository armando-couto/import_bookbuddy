require 'csv'
require 'json'
require 'bundler/inline'

gemfile do
  source 'https://rubygems.org'
  gem 'mysql2', '~> 0.5.4'
end

puts "Começando a Importar!"

data = CSV.read("BookBuddy.csv")

begin
  client = Mysql2::Client.new(:host => "localhost", :username => "root", :password => "root", :database => "library")

  books = "INSERT INTO `books` (`Title`,`Original Title`,`Subtitle`,`Series`,`Volume`,`Author`,`Author (Last First)`,`Illustrator`,`Narrator`,`Translator`,`Photographer`,`Editor`,`Publisher`,`Place of Publication`,`Date Published`,`Year Published`,`Original Date Published`,`Original Year Published`,`Edition`,`Genre`,`Summary`,`Guided Reading Level`,`Lexile Measure`,`Lexile Code`,`Grade Level Equivalent`,`Developmental Reading Assessment`,`Interest Level`,`AR Level`,`AR Points`,`AR Quiz Number`,`Word Count`,`Number of Pages`,`Format`,`Audio Runtime`,`Dimensions`,`Weight`,`List Price`,`Language`,`Original Language`,`DDC`,`LCC`,`LCCN`,`OCLC`,`ISBN`,`ISSN`,`Favorites`,`Rating`,`Physical Location`,`Status`,`Status Incompleted Reason`,`Status Hidden`,`Date Started`,`Date Finished`,`Current Page`,`Loaned To`,`Date Loaned`,`Borrowed From`,`Date Borrowed`,`Returned from Borrow`,`Not Owned Reason`,`Quantity`,`Condition`,`Recommended By`,`Date Added`,`User Supplied ID`,`User Supplied Descriptor`,`Tags`,`Purchase Date`,`Purchase Place`,`Purchase Price`,`Notes`,`Google VolumeID`,`Category`,`Wish List`,`Previously Owned`,`Up Next`,`Position`,`Uploaded Image URL`,`Activities`) "
  data.each_with_index do |item, index|
    if index > 0
      client.query("#{books} VALUES ('#{item[0].to_s.gsub('\'', '')}','#{item[1].to_s.gsub('\'', '')}','#{item[2].to_s.gsub('\'', '')}','#{item[3].to_s.gsub('\'', '')}','#{item[4].to_s.gsub('\'', '')}',
                                     '#{item[5].to_s.gsub('\'', '')}','#{item[6].to_s.gsub('\'', '')}','#{item[7].to_s.gsub('\'', '')}','#{item[8].to_s.gsub('\'', '')}','#{item[9].to_s.gsub('\'', '')}',
                                     '#{item[10].to_s.gsub('\'', '')}','#{item[11].to_s.gsub('\'', '')}','#{item[12].to_s.gsub('\'', '')}','#{item[13].to_s.gsub('\'', '')}','#{item[14].to_s.gsub('\'', '')}',
                                     '#{item[15].to_s.gsub('\'', '')}','#{item[16].to_s.gsub('\'', '')}','#{item[17].to_s.gsub('\'', '')}','#{item[18].to_s.gsub('\'', '')}','#{item[19].to_s.gsub('\'', '')}',
                                     '#{item[20].to_s.gsub('\'', '')}','#{item[21].to_s.gsub('\'', '')}','#{item[22].to_s.gsub('\'', '')}','#{item[23].to_s.gsub('\'', '')}','#{item[24].to_s.gsub('\'', '')}',
                                     '#{item[25].to_s.gsub('\'', '')}','#{item[26].to_s.gsub('\'', '')}','#{item[27].to_s.gsub('\'', '')}','#{item[28].to_s.gsub('\'', '')}','#{item[29].to_s.gsub('\'', '')}',
                                     '#{item[30].to_s.gsub('\'', '')}','#{item[31].to_s.gsub('\'', '')}','#{item[32].to_s.gsub('\'', '')}','#{item[33].to_s.gsub('\'', '')}','#{item[34].to_s.gsub('\'', '')}',
                                     '#{item[35].to_s.gsub('\'', '')}','#{item[36].to_s.gsub('\'', '')}','#{item[37].to_s.gsub('\'', '')}','#{item[38].to_s.gsub('\'', '')}','#{item[39].to_s.gsub('\'', '')}',
                                     '#{item[40].to_s.gsub('\'', '')}','#{item[41].to_s.gsub('\'', '')}','#{item[42].to_s.gsub('\'', '')}','#{item[43].to_s.gsub('\'', '')}','#{item[44].to_s.gsub('\'', '')}',
                                     '#{item[45].to_s.gsub('\'', '')}','#{item[46].to_s.gsub('\'', '')}','#{item[47].to_s.gsub('\'', '')}','#{item[48].to_s.gsub('\'', '')}','#{item[49].to_s.gsub('\'', '')}',
                                     '#{item[50].to_s.gsub('\'', '')}','#{item[51].to_s.gsub('\'', '')}','#{item[52].to_s.gsub('\'', '')}','#{item[53].to_s.gsub('\'', '')}','#{item[54].to_s.gsub('\'', '')}',
                                     '#{item[55].to_s.gsub('\'', '')}','#{item[56].to_s.gsub('\'', '')}','#{item[57].to_s.gsub('\'', '')}','#{item[58].to_s.gsub('\'', '')}','#{item[59].to_s.gsub('\'', '')}',
                                     '#{item[60].to_s.gsub('\'', '')}','#{item[61].to_s.gsub('\'', '')}','#{item[62].to_s.gsub('\'', '')}','#{item[63].to_s.gsub('\'', '')}','#{item[64].to_s.gsub('\'', '')}',
                                     '#{item[65].to_s.gsub('\'', '')}','#{item[66].to_s.gsub('\'', '')}','#{item[67].to_s.gsub('\'', '')}','#{item[68].to_s.gsub('\'', '')}','#{item[69].to_s.gsub('\'', '')}',
                                     '#{item[70].to_s.gsub('\'', '')}','#{item[71].to_s.gsub('\'', '')}','#{item[72].to_s.gsub('\'', '')}','#{item[73].to_s.gsub('\'', '')}','#{item[74].to_s.gsub('\'', '')}',
                                     '#{item[75].to_s.gsub('\'', '')}','#{item[76].to_s.gsub('\'', '')}','#{item[77].to_s.gsub('\'', '')}','#{item[78].to_s.gsub('\'', '')}');")
    end
  end

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