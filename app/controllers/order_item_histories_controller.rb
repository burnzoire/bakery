class OrderItemHistoriesController < ApplicationController
  before_action :set_order_item_history, only: [:show, :edit, :update, :destroy]
  before_action :set_order_item

  # GET /order_item_histories
  # GET /order_item_histories.json
  def index
    @order_item_histories = OrderItemHistory.all
  end

  # GET /order_item_histories/1
  # GET /order_item_histories/1.json
  def show
  end

  # GET /order_item_histories/new
  def new
    @order_item_history = OrderItemHistory.new
  end

  # GET /order_item_histories/1/edit
  def edit
  end

  # POST /order_item_histories
  # POST /order_item_histories.json
  def create
    @order_item_history = OrderItemHistory.new(order_item_history_params)

    respond_to do |format|
      if @order_item_history.save
        format.html { redirect_to @order_item_history, notice: 'Order item history was successfully created.' }
        format.json { render :show, status: :created, location: @order_item_history }
      else
        format.html { render :new }
        format.json { render json: @order_item_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /order_item_histories/1
  # PATCH/PUT /order_item_histories/1.json
  def update
    respond_to do |format|
      if @order_item_history.update(order_item_history_params)
        format.html { redirect_to @order_item_history, notice: 'Order item history was successfully updated.' }
        format.json { render :show, status: :ok, location: @order_item_history }
      else
        format.html { render :edit }
        format.json { render json: @order_item_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order_item_histories/1
  # DELETE /order_item_histories/1.json
  def destroy
    @order_item_history.destroy
    respond_to do |format|
      format.html { redirect_to order_item_order_item_histories_url(order_item_id: @order_item.id), notice: 'Order item history was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_order_item
      @order_item = OrderItem.find(params[:order_item_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_order_item_history
      @order_item_history = OrderItemHistory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_item_history_params
      params.require(:order_item_history).permit(:order_item_id, :quantity, :price_per_pack)
    end
end
