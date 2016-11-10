class RatingsController < ApplicationController
  before_action :require_sign_in

  def create
    @article = Article.find(params[:article_id])
    @rating = @article.ratings.build(rating_params)
    @rating.user = current_user
    if @rating.save
      flash[:notice] = "Rating was saved."
      @article.update_attribute(:score, @article.average_rating)
      @article.save
      redirect_to :back
    else
      flash[:alert] = "Rating was not saved."
      redirect_to :back
    end

    respond_to do |format|
      format.html
      format.js
    end

  end

  def update
    @rating = Rating.find(params[:id])
    @rating.assign_attributes(rating_params)

    if @rating.save
      flash[:notice] = "Rating was saved."
      redirect_to :back
    else
      flash[:alert] = "Rating was not saved."
      redirect_to :back
    end

    respond_to do |format|
      format.html
      format.js
    end
  end


  def destroy
    @rating.destroy

    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def rating_params
    params.require(:rating).permit(:value)
  end

end
