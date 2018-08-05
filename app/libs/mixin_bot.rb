module MixinBot
  def self.api
    @api ||= MixinBot::API.new
  end
end
