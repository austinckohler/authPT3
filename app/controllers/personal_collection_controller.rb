class PersonalCollectionController < ApplicationController
    def index
        authorization_header = request.headers["Authorization"]

        if !authorization_header
            render json: {error: "Incorrect information"}, status: :unauthorized
        else 
            token = authorization_header.split(" ")[1]
            secret = Rails.application.secrets.secret_key_base
        begin
            payload = JWT.decode(token, secret).first
            render json: {message: "Checkout your personal collection #{payload["username"]}!"}
        rescue
            render json: {message: "Checkout your personal collection #{payload["username"]}!"}
        end
            
        end
    end
end
