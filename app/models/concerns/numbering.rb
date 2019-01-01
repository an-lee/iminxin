module Numbering
  extend ActiveSupport::Concern

  included do
    validates :number, presence: true, uniqueness: true

    before_validation :setup_number, on: :create
  end

  private

  def setup_number
    loop do
      candidate = SecureRandom.random_number(11)
      unless self.class.exists?(number: candidate)
        self.number = candidate
        break
      end
    end
  end
end
