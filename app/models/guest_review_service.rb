class GuestReviewService < ReviewService
	belongs_to :guest, class_name: "User"
end
