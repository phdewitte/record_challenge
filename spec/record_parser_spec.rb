require_relative '../record_parser'

describe RecordParser do
  context "#read_names_from_file" do
    it "returns the array of entries from the file" do
      expect(RecordParser.read_names_from_file("spec/fixtures/artists.txt")).to be_an Array
    end

    it "creates an entry from each row of the file" do
      expect(RecordParser.read_names_from_file("spec/fixtures/artists.txt").length).to be 5
    end

    it "maintains the initial order of records from the file (first position)" do
      expect(RecordParser.read_names_from_file("spec/fixtures/artists.txt").first.last_name).to eq "Waits"
    end

    it "maintains the initial order of records from the file (last position)" do
      expect(RecordParser.read_names_from_file("spec/fixtures/artists.txt").last.last_name).to eq "Wilkenfeld"
    end
  end

  context "#save_name_to_file" do
    before(:each) do
      RecordParser.save_name_to_file('spec/fixtures/test_target.txt', ['Some, Random, Test, Text, Here', 'Hendrix | Jimi | Male | Purple | 1948-05-10', 'Jones, George, Male, Blue, 1985-06-18'])
    end

    it "adds a header row to the target file" do
      expect(RecordParser.read_names_from_file("spec/fixtures/test_target.txt").first.last_name).to eq 'last_name'
    end

    it "adds a new line to the target file for each entry" do
      expect(RecordParser.read_names_from_file("spec/fixtures/test_target.txt").size).to be 4
    end
  end

end