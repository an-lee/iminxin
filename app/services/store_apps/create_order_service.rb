class StoreApps::CreateOrderService
  Error = Class.new(StandardError)
  ProductQuantityNotSufficientError = Class.new(Error)
  ProductUnavailableError = Class.new(Error)

  def call(store, user, params)
    ActiveRecord::Base.transaction do
      product_ids = params[:items].map(&->(item) { item[:product_id] })
      products = store.products.where(id: product_ids)

      order = StoreAppOrder.create!(store_app: store, store_app_buyer: user)
      params[:items].each do |item|
        product = products.find { |v| v.id == item[:product_id].to_i }
        raise ProductUnavailableError, '该商品已下架' if product.blank?
        raise ProductQuantityNotSufficientError, '该商品库存不足' unless product.sufficient?(item[:quantity])

        # 添加商品到订单
        order.store_app_order_items.create!(
          store_app_product: product,
          quantity: item[:quantity]
        )
      end

      # 计算金额
      items_total = order.store_app_order_items.to_a.sum { |item| item.price * item.quantity }
      order.update!(items_total: items_total, total: items_total)

      order
    end
  end
end
