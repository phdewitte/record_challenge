require 'grape'

require_relative 'record'
require_relative 'record_collection'

module Recordizer
  class API < Grape::API
    format :json

    resource :records do
      desc 'Find all available records.'
      get :record_collection do
        "hello world"
        # RecordCollection.all
      end
    end

  end
end