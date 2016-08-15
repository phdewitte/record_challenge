require 'rack'
require 'rack/test'

require_relative '../record_api'

describe Recordizer::API do
  include Rack::Test::Methods

  def app
    Recordizer::API
  end

  context 'GET collection of all records' do
    it 'responds with a 200 ok status' do
      get '/api/records/record_collection'
      expect(last_response.status).to eq 200
    end

    it 'returns an empty array of records' do
      get '/api/records/record_collection'
      expect(JSON.parse(last_response.body)).to eq []
    end
  end
end