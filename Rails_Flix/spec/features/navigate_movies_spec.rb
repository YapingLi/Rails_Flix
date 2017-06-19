require 'rails_helper'

describe "Navigating movies" do
    
    it "allows navigation from the detail page to the listing page" do
        movie = Movie.create(movie_attributes)

        visit movie_url(movie)
        click_link("All Movies")

        expect(current_url).to eq(movies_url)
    end

    it "allows nagigation from the listing page to the detail page" do 
        movie = Movie.create(movie_attributes)

        visit movies_url
        click_link(movie.title)

        expect(current_url).to eq(movie_url(movie))
    end
end