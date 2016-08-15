require 'grape'

require_relative 'record'
require_relative 'record_collection'
require_relative 'record_parser'

module Recordizer
  class API < Grape::API
    format :json

    before do
      records = RecordParser.read_names_from_file('recordizer_endpoint_target.txt')
      @collection = RecordCollection.new(records: records)
    end

    resource :records do
      desc 'Retrieve a list of all the available records'
      get :collection do
        @collection.records
      end

      desc 'Post a new record to the collection.'
      params do
        requires :last_name, type: String, desc: 'Last Name'
        requires :first_name, type: String, desc: 'First Name'
        requires :gender, type: String, desc: 'Gender'
        requires :fav_color, type: String, desc: 'Favorite Color'
        requires :birthdate, type: String, desc: 'Birthdate (Ex: Year-Month-Date)'
      end
      post do
        Record.create!({
          last_name: params[:last_name],
          first_name: params[:first_name],
          gender: params[:gender],
          fav_color: params[:fav_color],
          birthdate: params[:birthdate]
        })
      end
    end

  end
end