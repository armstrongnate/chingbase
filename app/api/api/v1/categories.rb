module API
  module V1

    module Entities
      class Category < Grape::Entity
        expose :id
        expose :name
        expose :amount
      end
    end

    class Categories < Grape::API
      resource :categories do
        desc 'Return a list of all categories'
        get do
          categories = Category.all
          present categories, with: Entities::Category
        end
      end
    end

  end
end
