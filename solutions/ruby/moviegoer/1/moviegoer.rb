class NotMovieClubMemberError < RuntimeError; end

class Moviegoer
  STANDARD_PRICE = 15
  SENIOR_PRICE = 10

  def initialize(age, member: false)
    @age = age
    @member = member
  end

  def ticket_price
    (@age >= 60) ? SENIOR_PRICE : STANDARD_PRICE
  end

  def watch_scary_movie?
    # Using ternary here for sake of exercise, could do with just "@age >= 18"
    @age >= 18 ? true : false
  end

  # Popcorn is 🍿
  def claim_free_popcorn!
    @member ? "🍿" : (raise NotMovieClubMemberError.new)
  end
end
