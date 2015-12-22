require 'rails_helper'

describe Category do

  describe '#valid?' do
    it 'is a valid factory' do
      expect(build(:category).valid?).to be_truthy
    end
  end

end
