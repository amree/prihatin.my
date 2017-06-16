class Utilities
  def self.random_chars(length = 6)
    (0...length).map { (65 + rand(26)).chr }.join.downcase
  end
end
