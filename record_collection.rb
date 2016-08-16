require_relative 'record'

class RecordCollection

  attr_reader :records

  def initialize(records_array)
    @records = records_array
  end

  def sort_by_gender
    records.sort_by { |record| [record.gender, record.last_name] }
  end

  def sort_by_birthdate
    records.sort_by { |record| record.parsed_bday }
  end

  def sort_by_last_name
    records.sort_by { |record| record.last_name }.reverse
  end

end