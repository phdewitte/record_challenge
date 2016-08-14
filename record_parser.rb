require_relative 'artist'

module RecordParser

  def self.attribute_separator(attribute_string)
    if attribute_string.include?(',')
      attribute_string.chop.split(', ')
    elsif attribute_string.include?('|')
      attribute_string.chop.split(' | ')
    end
  end

  def self.read_names_from_file(filename)
    artist_entries = []
    File.foreach(filename) do |row|
      artist_attributes = self.attribute_separator(row)
      artist_entries << Artist.new(
        first_name: artist_attributes[0],
        last_name: artist_attributes[1],
        gender: artist_attributes[2],
        fav_color: artist_attributes[3],
        birthdate: artist_attributes[4])
    end
    p artist_entries
  end

end

RecordParser.read_names_from_file('fixtures/artists.txt')