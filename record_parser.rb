require 'csv'
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
    CSV.foreach(filename, headers: true, header_converters: :symbol) do |row|
      record_entries << Record.new(row)
    end
    record_entries
  end

  def self.save_name_to_file(filename, record_array)
    CSV.open(filename, mode='w') do |row|
      header_array = ["last_name","first_name","gender","fav_color","birthdate"]
      row << header_array
      record_array.each do |record|
        row << record.artist_attributes
      end
    end
  end

end

# new object should indeed be created at read, not at write
# program needs to accept post in the format written for attr attribute_separator