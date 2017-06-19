require 'rails_helper'

describe 'Viewing a single movie' do

    it "shows the movie's detail" do
        movie = Movie.create(movie_attributes)

        visit movie_path(movie)

        expect(page).to have_text(movie.title)
        expect(page).to have_text(movie.rating)
        expect(page).to have_text(movie.description[0..10])
        expect(page).to have_text(movie.released_on)
    end

    it "shows the total gross if the total gross exceeds $50M" do
        movie = Movie.create(movie_attributes(total_gross: 600000000))

        visit movie_path(movie)

        expect(page).to have_text('$600,000,000.00')
    end

    it "shows 'Flop!' if the total gross is less then $50M" do
        movie = Movie.create(movie_attributes(total_gross: 1000000))

        visit movie_path(movie)

        expect(page).to have_text('Flop!')
    end
    
end