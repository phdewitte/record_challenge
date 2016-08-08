require_relative 'record_parse'

describe FileParser do
  let(:parser) { FileParser.new }

  context "#initialize" do
    it "creates an array for records from CSV file" do
      expect(parser.file_entries).to be_an Array
    end

    it "does not populate the collection" do
      expect(parser.file_entries.empty?).to be true
    end
  end

  # context "#read_file" do
  #   it
  # end

end