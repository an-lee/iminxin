module Numbering
  extend ActiveSupport::Concern

  included do
    validates :number, presence: true, uniqueness: true

    before_validation :setup_number, on: :create
  end

  private

  def setup_number
    loop do
      candidate = SecureRandom.uuid
      unless self.class.exists?(number: candidate)
        self.number = candidate
        break
      end
    end
  end
end
