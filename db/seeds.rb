Administrator.create_with(password: Figaro.env.DEFAULT_ADMIN_PASSWORD!)
  .find_or_create_by!(name: Figaro.env.DEFAULT_ADMIN_NAME!)
