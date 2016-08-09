class Artist

  attr_reader :first_name, :last_name, :gender, :fav_color, :birthdate

  def initialize(artist_attributes)
    @first_name = artist_attributes[:first_name]
    @last_name = artist_attributes[:last_name]
    @gender = artist_attributes[:gender]
    @fav_color = artist_attributes[:fav_color]
    @birthdate = artist_attributes[:birthdate]
  end

end