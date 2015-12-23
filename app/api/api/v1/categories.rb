module API
  module V1

    module Entities
      class Category < Grape::Entity
        expose :id
        expose :name
        expose :amount_in_dollars
      end
    end

    class Categories < Grape::API
      resource :categories do
        desc 'Return a list of all categories'
        get do
          categories = Category.all
          present categories, with: Entities::Category
        end

        desc 'Create a category'
        params do
          requires :name, type: String, allow_blank: false, desc: 'The name of the category'
          requires :amount_in_dollars, type: String, allow_blank: false, desc: 'The monthly budget for this category in dollars'
        end
        post do
          category = Category.create!({
            name: params[:name],
            amount_in_dollars: params[:amount_in_dollars]
          })
          present category, with: Entities::Category
        end
      end
    end

  end
end
