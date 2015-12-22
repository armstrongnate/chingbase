require 'rails_helper'

describe API::V1 do

  categories_path = "/api/v1/categories"

  describe "GET #{categories_path}" do
    it 'returns an empty array of categories' do
      get categories_path
      expect(response.status).to eq(200)
      expect(JSON.parse(response.body)).to eq([])
    end
  end

end
