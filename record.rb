require 'date'

class Record

  attr_reader :first_name, :last_name, :gender, :fav_color, :birthdate

  def initialize(artist_attributes)
    @first_name = artist_attributes[:first_name]
    @last_name = artist_attributes[:last_name]
    @gender = artist_attributes[:gender]
    @fav_color = artist_attributes[:fav_color]
    @birthdate = artist_attributes[:birthdate]
  end

  def parsed_bday
    Date.parse(@birthdate)
  end

  def formatted_bday
    parsed_bday.strftime('%e %B, %Y')
  end

  def display_info
    "Name: #{first_name} #{last_name} Gender: #{gender} Favorite Color: #{fav_color} Birthdate: #{formatted_bday}"
  end

end