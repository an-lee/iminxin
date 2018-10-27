task build_default_currencies: :environment do
  [
    '965e5c6e-434c-3fa9-b780-c50f43cd955c',
    '3edb734c-6d6f-32ff-ab03-4eb43640c758',
    '43b645fc-a52c-38a3-8d3b-705e7aaefa15',
    'c94ac88f-4671-3976-b60a-09064f1811e8'
  ].each do |asset_id|
    r = MixinBot.api.read_asset(asset_id)['data']
    Currency.create_with(
      name: r['name'],
      symbol: r['symbol'],
      chain_id: r['chain_id'],
      icon_url: r['icon_url'],
    ).find_or_create_by(asset_id: r['asset_id'])
  end
end
