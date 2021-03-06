class ItemPacksController < ApplicationController
  before_action :set_item_pack, only: [:show, :edit, :update, :destroy]
  before_action :set_item

  # GET /item_packs
  # GET /item_packs.json
  def index
    @item_packs = ItemPack.all
  end

  # GET /item_packs/1
  # GET /item_packs/1.json
  def show
  end

  # GET /item_packs/new
  def new
    @item_pack = ItemPack.new(item_id: @item.id)
  end

  # GET /item_packs/1/edit
  def edit
  end

  # POST /item_packs
  # POST /item_packs.json
  def create
    @item_pack = ItemPack.new(item_pack_params.merge(item_id: @item.id))

    respond_to do |format|
      if @item_pack.save
        format.html { redirect_to @item_pack.item, notice: 'Item pack was successfully created.' }
        format.json { render :show, status: :created, location: @item_pack }
      else
        format.html { render :new }
        format.json { render json: @item_pack.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /item_packs/1
  # PATCH/PUT /item_packs/1.json
  def update
    respond_to do |format|
      if @item_pack.update(item_pack_params)
        format.html { redirect_to @item_pack.item, notice: 'Item pack was successfully updated.' }
        format.json { render :show, status: :ok, location: @item_pack }
      else
        format.html { render :edit }
        format.json { render json: @item_pack.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /item_packs/1
  # DELETE /item_packs/1.json
  def destroy
    @item_pack.destroy
    respond_to do |format|
      format.html { redirect_to item_path(@item_pack.item), notice: 'Item pack was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_item
      @item = Item.find(params[:item_id]) if params[:item_id]
    end
    
    # Use callbacks to share common setup or constraints between actions.
    def set_item_pack
      @item_pack = ItemPack.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_pack_params
      params.require(:item_pack).permit(:item_id, :quantity, :price)
    end
end
