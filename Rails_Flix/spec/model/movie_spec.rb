require "rails_helper"

describe "Movie model" do 

    it "is released when released on date is in the past" do
        movie = Movie.create(movie_attributes(released_on: 1.month.ago))
        expect(Movie.released).to include(movie)
    end

    it "is not released when the released on date is in the future" do
        movie = Movie.create(movie_attributes(released_on: 1.month.from_now))
        expect(Movie.released).not_to include(movie)        
    end

    it "returns released movies ordered with the most recently-released movie first" do
        movie1 = Movie.create(movie_attributes(released_on: 1.month.ago))
        movie2 = Movie.create(movie_attributes(released_on: 2.month.ago))
        movie3 = Movie.create(movie_attributes(released_on: 3.month.ago))

        expect(Movie.released).to include(movie1, movie2, movie3)
    end
    
    it "is a hit when total gross is higher than $300M" do
        movie = Movie.create(movie_attributes(total_gross: 350000000))
        expect(Movie.hit).to include(movie) 
    end

    it "is not a hit when total gross is lower than  $300M" do
        movie = Movie.create(movie_attributes(total_gross: 250000000))
        expect(Movie.hit).not_to include(movie) 
    end

    it "returns movies ordered with the highest total gross movie first" do
        movie1 = Movie.create(movie_attributes(total_gross: 500000000))
        movie2 = Movie.create(movie_attributes(total_gross: 600000000))
        movie3 = Movie.create(movie_attributes(total_gross: 700000000)) 

        expect(Movie.hit).to include(movie3, movie2, movie1)       
    end
end