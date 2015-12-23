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

  context 'when a category exists' do
    describe "GET #{categories_path}" do
      it 'returns the category' do
        @category = create(:category)

        get categories_path
        expect(response.status).to eq(200)
        expect(response.body).to eq([
          {
            id: @category.id,
            name: @category.name,
            amount_in_dollars: @category.amount_in_dollars
          }
        ].to_json)
      end
    end
  end

  context 'with valid attributes' do
    def valid_attributes
      { name: 'Groceries', amount_in_dollars: '400.00' }
    end

    describe "POST #{categories_path}" do
      it 'creates a new category' do
        expect {
          post categories_path, valid_attributes
        }.to change(Category, :count).by(1)
      end

      it 'has the correct status code' do
        post categories_path, valid_attributes
        expect(response.status).to eq(201)
      end

      it 'has the newly created category' do
        post categories_path, valid_attributes
        json = JSON.parse(response.body)
        expect(json['id']).not_to be_nil
        expect(json['name']).to eq('Groceries')
        expect(json['amount_in_dollars']).to eq('400.00')
      end
    end
  end

end
