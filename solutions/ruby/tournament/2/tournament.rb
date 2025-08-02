module Tournament
  class Record
    attr_reader :name
    attr_accessor :wins, :losses, :draws

    def initialize(name)
      @name = name
      @wins = 0
      @losses = 0
      @draws = 0
    end

    def to_s
      mp = @wins + @losses + @draws
      points = @wins * 3 + @draws
      ["%-30s" % @name, [mp, @wins, @draws, @losses, points].map { |s| "%2d" % s }]
        .flatten
        .join(" | ")
    end
  end

  def self.tally(input)
    teams = {}
    input.lines.map(&:chomp).select { |line| !line.empty? }.each do |line|
      line.split(";") => [home, guest, result]

      [home, guest].each { |team| teams[team] = Record.new(team) unless teams[team] }

      case result
      when "win"
        teams[home].wins += 1
        teams[guest].losses += 1
      when "loss"
        teams[home].losses += 1
        teams[guest].wins += 1
      when "draw"
        teams[home].draws += 1
        teams[guest].draws += 1
      end
    end

    res = [["%-30s" % "Team", "MP", " W", " D", " L", " P"].join(" | ")]

    unless teams.empty?
      res.push(teams.values.sort_by { |team| [-3 * team.wins - team.draws, team.name] })
    end

    res.join("\n") + "\n"
  end
end
