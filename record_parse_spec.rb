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

  context "#read_names_from_file" do
    it "creates an entry from each row of the file" do
      expect(parser.read_names_from_file("fixtures/artists.txt").length).to be 5
    end

    it "returns the array of entries from the file" do
      expect(parser.read_names_from_file("fixtures/artists.txt")).to be_an Array
    end

    it "maintains the initial order of records from the file (first position)" do
      expect(parser.read_names_from_file("fixtures/artists.txt").first).to include "Waits, Tom"
    end

    it "maintains the initial order of records from the file (last position)" do
      expect(parser.read_names_from_file("fixtures/artists.txt").last).to include "Wilkenfeld | Tal"
    end


  end

end