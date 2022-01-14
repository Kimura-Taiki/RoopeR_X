class ZasController < ApplicationController
  require 'csv' # ←忘れがちのため要注意
  # ちなみにrequire関数はRubyの提供するライブラリー導入用の関数
  # 'csv'はRubyに標準添付されているCSVを扱うためのライブラリー

  def index
    @zas = Za.all
    @za = Za.new
  end

  def new
    # 便宜上CSV出力ページに転用
    @zas = Za.all
    respond_to do |fm|
      fm.html
      fm.csv do |csv|
        send_zas_csv(@zas)
      end
    end
    # @post = Post.new
    # @posts = Post.all
    # # respond_to はリクエストに応じた処理を行うメソッドです。
    # # 通常時はhtmlをリクエストしているので、処理は記述していません。
    # # viewのlink_toでformatをcsvとして指定しているので、
    # # リンクを押すとsend_posts_csv(@posts)の処理を行います。
    # respond_to do |format|
    #   format.html
    #   format.csv do |csv|
    #     send_posts_csv(@posts)
    #   end
    # end
  end

  def create
    p "クリエイトへ来たぞー"
    @c1 = params.require(:za)[:category1].to_i
    @c2 = params.require(:za)[:category2].to_i
    p @c1
    p @c2
    @za = Za.new(za_params)
    if @za.save
      if @c1 != 0
        @zc_a = ZaCategoryAttribution.new
        @zc_a.za_id = @za.id
        @zc_a.category_id = @c1
        @zc_a.save
      end
      if @c2 != 0
        @zc_a = ZaCategoryAttribution.new
        @zc_a.za_id = @za.id
        @zc_a.category_id = @c2
        @zc_a.save
      end
      redirect_to zas_path
    else
      render :index
    end
  end

  def show
  end

  def editst
  end

  def update
  end

  def destroy
  end

  private
  def za_params
    params.require(:za).permit(:name, :paranoia_limit, :image)
  end

  def send_zas_csv(zas)
    csv_data = CSV.generate do |csv|
      column_names = %w(名称 不安臨界 画像名)
      csv << column_names
      zas.each do |z|
        column_values = [
          z.name,
          z.paranoia_limit,
          z.image_id,
        ]
        csv << column_values
      end
    end
    send_data(csv_data, filename: "座の一覧.csv")
  end

  # def send_posts_csv(posts)
  #   # CSV.generateとは、対象データを自動的にCSV形式に変換してくれるCSVライブラリの一種
  #   csv_data = CSV.generate do |csv|
  #     # %w()は、空白で区切って配列を返します
  #     column_names = %w(投稿者名 タイトル 本文)
  #     # csv << column_namesは表の列に入る名前を定義します。
  #     csv << column_names
  #     # column_valuesに代入するカラム値を定義します。
  #     posts.each do |post|
  #       column_values = [
  #         post.user.name,
  #         post.title,
  #         post.body,
  #               ]
  #     # csv << column_valueshは表の行に入る値を定義します。
  #       csv << column_values
  #     end
  #   end
  #   # csv出力のファイル名を定義します。
  #   send_data(csv_data, filename: "投稿一覧.csv")
  # end
end
