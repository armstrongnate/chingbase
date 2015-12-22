module API

  module V1
    class Root < Grape::API
      version 'v1'
      mount API::V1::Categories
    end
  end

end
