require_relative 'record_parse'

describe CSVParser do
  let(:parser) { CSVParser.new }

  context "#initialize" do
    it "creates an array for records from CSV file" do
      expect(parser.csv_entries).to be_an Array
    end

    it "does not populate the collection" do
      expect(parser.csv_entries.empty?).to be true
    end
  end

  context "#read_csv" do
    it
  end

end