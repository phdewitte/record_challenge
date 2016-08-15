require 'grape'

require_relative 'record'
require_relative 'record_collection'

module Recordizer
  class API < Grape::API
    version 'v1', using: :path, vendor: 'recordizer'
    format :json
    prefix :api

    resource :records do
      desc 'Find all available records.'
      get :record_collection do
        RecordCollection.all
      end

    end

  end
end