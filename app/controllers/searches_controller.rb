class SearchesController < ApplicationController
  def search
  end

  def foursquare
    Faraday.get 'https://api.foursquare.com/v2/venues/search' do |req|
      req.params['client_id'] = 'IBZ3FF3ZQ3WQW2HXK2QZ25KNWUEZAQLX0HY43NX3BZVMSBRJ'
      req.params['client_secret'] = 'XR243KWTOR4WQZ0VBKN04FILYYKPT5PBFG4FVOJF0SNOD5OR'
      req.params['v'] = '20160201'
      req.params['near'] = params[:zipcode]
      req.params['query'] = 'coffee shop'
    end
    body_hash = JSON.parse(@resp.body)
    @venues = body_hash["response"]["venues"]
    render 'search'
  end
end
