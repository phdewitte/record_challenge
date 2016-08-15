require_relative 'record'

module RecordParser

  def self.attribute_separator(attribute_string)
    if attribute_string.include?(',')
      attribute_string.chop.split(', ')
    elsif attribute_string.include?('|')
      attribute_string.chop.split(' | ')
    end
  end

  def self.read_names_from_file(filename)
    record_entries = []
    File.foreach(filename) do |row|
      record_attributes = self.attribute_separator(row)
      record_entries << Record.new(
        last_name: record_attributes[0],
        first_name: record_attributes[1],
        gender: record_attributes[2],
        fav_color: record_attributes[3],
        birthdate: record_attributes[4])
    end
    record_entries
  end

end

RecordParser.read_names_from_file('fixtures/artists.txt')