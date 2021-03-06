class Movie < ApplicationRecord

    def flop?
        total_gross.blank? || total_gross < 50000000
    end

    def self.released
        where("released_on <= ?", Time.now).order("released_on desc")
    end

    def self.hit
        where("total_gross >= ?", "300000000").order("total_gross desc")
    end
end
