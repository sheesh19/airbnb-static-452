require "open-uri"

class FlatsController < ApplicationController
    # before any other action (i.e. index or show), run the set_flats method
    before_action :set_flats

    def index; end

    def show
        flat_id = params[:id]
        @flat = @flats.find { |flat| flat["id"] == flat_id.to_i }
    end

    private

    def set_flats
        url = "https://raw.githubusercontent.com/lewagon/flats-boilerplate/master/flats.json"
        @flats = JSON.parse(open(url).read)
    end
end
