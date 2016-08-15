require_relative '../record'

describe Record do
  let(:record) { Record.new(first_name: "Hank", last_name: "Williams", gender: "Male", fav_color: "Brown", birthdate: "1923-09-17") }

  context "#initialize" do
    it "assigns the record a first name" do
      expect(record.first_name).to eq "Hank"
    end

    it "assigns the record a last name" do
      expect(record.last_name).to eq "Williams"
    end

    it "assigns the record a gender" do
      expect(record.gender).to eq "Male"
    end

    it "assigns the record a favorite color" do
      expect(record.fav_color).to eq "Brown"
    end

    it "assigns the record a birthdate" do
      expect(record.birthdate).to eq "1923-09-17"
    end
  end

  context "#parsed_bday" do
    it "parses the birthdate string" do
      expect(record.parsed_bday).to eq Date.parse(record.birthdate)
    end
  end

  context "#formatted_bday" do
    it "displays the record's birthdate in a proper format" do
      expect(record.formatted_bday).to eq "17 September, 1923"
    end
  end

  context "#display_info" do
    it "displays all the record's information in a readable format" do
      expect(record.display_info).to eq "Name: Hank Williams Gender: Male Favorite Color: Brown Birthdate: 17 September, 1923"
    end
  end

end