class MxApps::Store::ProductsController < MxApps::BaseController
  def index
    @products = current_mx_app.products.page(params[:page])
  end

  def new
    @product = current_mx_app.products.new
  end

  def create
    @product = current_mx_app.products.new(product_params)
    if @product.save
      redirect_to mx_app_store_products(current_mx_app)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to mx_app_store_products(current_mx_app)
    else
      render :edit
    end
  end

  private

  def product_params
    params.require(:mx_app_store_product).permit(:name, :introduction, :cover)
  end
end
