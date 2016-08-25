require 'grape'

require_relative 'record'
require_relative 'record_collection'
require_relative 'record_parser'

module Recordizer
  class API < Grape::API
    format :json
    content_type :txt, 'text/plain'

    helpers do
      def format_json(record_array)
        { "record_info" => record_array.map {|obj| obj.to_json} }
      end
    end

    before do
      records = RecordParser.read_names_from_file('recordizer_database.csv')
      @record_collection = RecordCollection.new(records)
      @collection = @record_collection.records
    end

    resource :records do
      desc 'Post a new record to the collection.'
      post do
        input_split = RecordParser.attribute_separator(params[:record])
        new_record = Record.create({
                    last_name: input_split[0],
                    first_name: input_split[1],
                    gender: input_split[2],
                    fav_color: input_split[3],
                    birthdate: input_split[4]
          })
        @collection << new_record
        RecordParser.save_name_to_file('recordizer_database.csv', @collection)
        format_json(@collection)
      end

      desc 'Retrieve a list of all the available records, sorted by gender'
      get :gender do
        format_json(@record_collection.sort_by_gender)
      end

      desc 'Retrieve a list of all the available records, sorted by brith date'
      get :birthdate do
        format_json(@record_collection.sort_by_birthdate)
      end

      desc 'Retrieve a list of all the available records, sorted by last name'
      get :name do
        format_json(@record_collection.sort_by_last_name)
      end

    end

  end
end