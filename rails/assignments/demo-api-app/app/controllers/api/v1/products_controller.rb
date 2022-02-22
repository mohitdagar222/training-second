class Api::V1::ProductsController < ActionController::Base
  skip_before_action :verify_authenticity_token

  def index
    if params[:category_id].present?
      category = Category.find_by(id: params[:category_id])
      if category.present?
        product = category.products
      else
        render json: { status: "ERROR", message: " No Category found for given id", data: "No Product found" }, status: :unprocessable_entity and return
      end
    else
      product = Product.all
    end
    render json: { status: "SUCCESS", message: "Loaded successfully", data: ActiveModelSerializers::SerializableResource.new(product, each_serializer: ProductSerializer) }
  end

  def create
    category = Category.find_by(id: params[:category_id])
    if category.present?
      product = category.products.create(product_params)
    else
      product = Product.create(product_params)
    end
    render json: { status: "SUCCESS", message: "Created successfully", data: product }, status: :ok
  end

  def show
    if params[:category_id].present?
      product = Product.find_by(id: params[:id], category_id: params[:category_id])
      if !product.present?
        render json: { status: "ERROR", message: " No Category found for given id", data: "No Product found" }, status: :unprocessable_entity and return
      end
    else
      product = Product.find_by(id: params[:id])
    end
    render json: { status: "SUCCESS", message: "Fetched successfully", data: product }, status: :ok
  end

  def destroy
    if params[:category_id].present?
      product = Product.find_by(id: params[:id], category_id: params[:category_id])
      if product.present?
        product.destroy
        render json: { status: "SUCCESS", message: "Deleted successfully", data: product }, status: :ok
      else
        render json: { status: "ERROR", message: " Not Deleted", data: "No Product found" }, status: :unprocessable_entity and return
      end
    else
      product = Product.find_by(id: params[:id])
      if product.present?
        product.destroy
        render json: { status: "SUCCESS", message: "Deleted successfully", data: product }, status: :ok
      else
        render json: { status: "ERROR", message: " Not Deleted", data: "No Product found" }, status: :unprocessable_entity and return
      end
    end
  end

  def update
    if params[:category_id].present?
      product = Product.find_by(id: params[:id], category_id: params[:category_id])
      if product.present?
        product.update(product_params)
        render json: { status: "SUCCESS", message: "Updated successfully", data: product }, status: :ok
      else
        render json: { status: "ERROR", message: " Not Updated", data: "No Product found" }, status: :unprocessable_entity and return
      end
    else
      product = Product.find_by(id: params[:id])
      if product.present?
        product.update(product_params)
        render json: { status: "SUCCESS", message: "updated successfully", data: product }, status: :ok
      else
        render json: { status: "ERROR", message: " Not Updated", data: "No Product found" }, status: :unprocessable_entity and return
      end
    end
  end

  private

  def product_params
    params.permit(:id, :name, :price, :category_id)
  end
end
