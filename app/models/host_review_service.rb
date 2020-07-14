class HostReviewService < ReviewService
	belongs_to :host, class_name: "User"
end
