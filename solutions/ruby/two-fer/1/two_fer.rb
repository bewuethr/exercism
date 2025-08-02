class TwoFer
  def self.two_fer(*name)
    "One for #{name ? "you" : name[0]}, one for me."
  end
end
