Administrator.create_with(password: Figaro.env.DEFAULT_ADMIN_PASSWORD!)
  .find_or_create_by!(name: Figaro.env.DEFAULT_ADMIN_NAME!)

[
  '965e5c6e-434c-3fa9-b780-c50f43cd955c',
  '43b645fc-a52c-38a3-8d3b-705e7aaefa15',
  'c94ac88f-4671-3976-b60a-09064f1811e8',
  '6cfe566e-4aad-470b-8c9a-2fd35b49c68d',
  'c6d0c728-2624-429b-8e0d-d9d19b6592fa',
  '43d61dcd-e413-450d-80b8-101d5e903357',
  '815b0b1a-2764-3736-8faa-42d694fa620a',
  '6cfe566e-4aad-470b-8c9a-2fd35b49c68d',
  'fd11b6e3-0b87-41f1-a41f-f0e9b49e5bf0'
].each do |asset_id|
  r = MixinBot.api.read_asset(asset_id)['data']
  Currency.create_with(
    name: r['name'],
    symbol: r['symbol'],
    chain_id: r['chain_id'],
    icon_url: r['icon_url'],
  ).find_or_create_by(asset_id: r['asset_id'])
end
