
/////--- TODOS ---/////

//REFACTOR UP/DOWNVOTING//




$(document).ready(function(){
	
	
	/////--- Comment ---/////
	
	/// UPVOTE ///
	var $comment = $(".comment")
	
	var $upvote = $(".upvote")
	
	$upvote.on("click", function(event){
		event.preventDefault();
		
		var $comment = $(this).closest(".comment")
		var comment_id = $comment.data("comment-id")
		var $votes = $comment.find(".vote-count")
		var score = parseInt($votes.html())
		var selected = $comment.find(".upvote.highlighted")[0] !== undefined
		var downvoted = $comment.find(".downvote.highlighted")[0] !== undefined
		
		if(selected) {
			$votes.html(score - 1)

		} else {
			if(downvoted) {
				$votes.html(score + 2)
			} else {
				$votes.html(score + 1)
			}
		}
		$comment.find(".upvote").toggleClass("highlighted")
		$comment.find(".downvote").removeClass("highlighted")
		
		$.ajax({
			url: "/comments/" + comment_id + "/upvote",
			type: "POST"
		})
		
	})
	
	/// DOWNVOTE ///
	var $comment = $(".comment")
	
	var $downvote = $(".downvote")
	
	$downvote.on("click", function(event){
		event.preventDefault();
		
		var $comment = $(this).closest(".comment")
		var comment_id = $comment.data("comment-id")
		var $votes = $comment.find(".vote-count")
		var score = parseInt($votes.html())
		var selected = $comment.find(".downvote.highlighted")[0] !== undefined
		var upvoted = $comment.find(".upvote.highlighted")[0] !== undefined
		
		if(selected) {
			$votes.html(score + 1)
		} else {
			if(upvoted) {
			  $votes.html(score - 2)
			} else {
				$votes.html(score - 1)
			}
		}
		$comment.find(".downvote").toggleClass("highlighted")
		$comment.find(".upvote").removeClass("highlighted")
		$.ajax({
			url: "/comments/" + comment_id + "/downvote",
			type: "POST"
		})
		
	})
});
