require 'rails_helper'

describe Category do

  describe '#valid?' do
    it 'is a valid factory' do
      expect(build(:category).valid?).to be_truthy
    end
  end

  context 'amount is 100' do
    describe '#amount_in_dollars' do
      it "should be '1.00'" do
        category = build(:category, amount: 100)
        expect(category.amount_in_dollars).to eq('1.00')
      end
    end
  end

end
