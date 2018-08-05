module Numbering
  extend ActiveSupport::Concern

  included do
    validates :number, presence: true, uniqueness: true

    before_validation :setup_number, on: :create
  end

  private

  def setup_number
    loop do
      now = Time.current
      candidate = now.strftime('%Y%m%d%H%M%S') + now.nsec.to_s
      candidate.ljust(24, rand(10).to_s)
      unless self.class.exists?(number: candidate)
        self.number = candidate
        break
      end
    end
  end
end
