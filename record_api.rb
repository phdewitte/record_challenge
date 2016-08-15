module Recordizer
  class API < Grape::API
    version 'v1', using: :path, vendor: 'recordizer'
    format :json
    prefix :api



  end
end