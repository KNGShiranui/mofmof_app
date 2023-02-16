class RentalsController < ApplicationController
  before_action :set_rental, only: %i[edit update show destroy]

  def index
    @rentals = Property.all
  end

  def new
    if params[:back]  #戻るボタンで確認画面から戻った場合にデータを保持して戻る
      @rental = Property.new(rental_params)
    else
      @rental = Property.new
      2.times { @rental.nearest_station.build }  
      # @rental.nearest_station.buildの「nearest_station」はアソシエーションメソッド
      # 別にnewでもいいが、慣習的にアソシエーションした状態のインスタンスを生成する際にはbuildメソッドを用いるようだ
      # {}内を2回繰り返し。rubyのtimesメソッドを使っているだけ
    end
  end

  def show
  end

  def edit
    @rental.nearest_station.build  #編集の際に最寄り駅を追加するための記述
  end

  def create
    @rental = Property.new(rental_params)
    if params[:back]
      render :new  #戻った場合はnewと同じやり方にしろということ。つまり、データを保持したまま戻る。
    else 
      if @rental.save
        redirect_to rentals_path, notice: "物件情報を登録しました"
      else
        rennder :new
      end
    end
  end

  def update
    if @rental.update(rental_params)
      redirect_to rentals_path, notice: "物件情報を変更しました"
    else
      render :edit
    end
  end


  def destroy
    @rental.destroy
    redirect_to rentals_path, notice: "物件情報を削除しました"
  end

  def confirm
    @rental = Property.new(rental_params)
    render :new if @rental.invalid?
  end

  private

  def set_rental
    @rental = Property.find(params[:id])
  end

  def rental_params
    params.require(:property).permit(%i[name rent addres age remarks nearest_stations_attributes(%i[id line station time])])  #TODO:ここは%iでは書けない？
  end
end
