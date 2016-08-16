require 'grape'

require_relative 'record'
require_relative 'record_collection'
require_relative 'record_parser'

module Recordizer
  class API < Grape::API
    format :json

    helpers do
      def format_json(record_array)
        { "record_info" => record_array.map {|obj| obj.to_json} }
      end
    end

    before do
      records = RecordParser.read_names_from_file('spec/fixtures/artists.txt')
      @record_collection = RecordCollection.new(records)
    end

    resource :records do
      desc 'Post a new record to the collection.'
      params do
        requires :last_name, type: String, desc: 'Last Name'
        requires :first_name, type: String, desc: 'First Name'
        requires :gender, type: String, desc: 'Gender'
        requires :fav_color, type: String, desc: 'Favorite Color'
        requires :birthdate, type: String, desc: 'Birthdate (Ex: Year-Month-Date)'
      end

      post do
        new_record = Record.create!({
                  last_name: params[:last_name],
                  first_name: params[:first_name],
                  gender: params[:gender],
                  fav_color: params[:fav_color],
                  birthdate: params[:birthdate]
                })

        @record_collection << new_record
        RecordParser.save_name_to_file('recordizer_endpoint_target.txt', @record_collection)
        format_json(new_record)
      end

      desc 'Retrieve a list of all the available records, sorted by gender'
      get :gender do
        format_json(@record_collection.sort_by_gender)
      end

      desc 'Retrieve a list of all the available records, sorted by brith date'
      get :birthdate do
        p format_json(@record_collection.sort_by_birthdate)
      end

      desc 'Retrieve a list of all the available records, sorted by last name'
      get :name do
        format_json(@record_collection.sort_by_last_name)
      end

    end

  end
end