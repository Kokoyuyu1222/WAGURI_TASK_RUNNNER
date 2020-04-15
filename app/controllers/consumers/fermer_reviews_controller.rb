class Consumers::FermerReviewsController < ApplicationController
	layout 'consumer'
	def create
	    @fermer = Fermer.find(params[:fermer_id])
		@review = @fermer.fermer_review.build(fermer_review_params)
		@review.consumer_id = current_consumer.id
		 if @comment.save
		 	flash[:success] = "Comment was successfully created."
		 else
           @fermer_reviews = FermerReview.where(id: @book)
         end
	end

	def destroy
		@fermer_review = FermerReview.find(params[:fermer_id])
        @fermer = @fermer_review.fermer
	    @fermer = Feremer.find(params[:fermer_id])
		@review = current_consumer.fermer_reviews.find(params[:id])
		if @book_review.user != current_user
           redirect_to request.referer
        end
		@comment.destroy
	   end
	end

	private
	def fermer_review_params
		params.require(:fermer_review).permit(:comment, :consumer_id, :fermer_id,:rate,:title)
	end
end
