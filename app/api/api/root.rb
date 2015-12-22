module API

  class Root < Grape::API
    prefix :api
    format :json
    rescue_from :all

    mount API::V1::Root
  end

end
