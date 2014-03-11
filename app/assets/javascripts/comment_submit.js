$(document).ready(function(){
	
	var $first = $("#first-comment");
	var $comments = $("#comments-index");
	var article = $('[name="comment[article_id]"]').val();
	var name = $('[name="user_name"]').val();
	
	$first.on("submit", function(event){
		formData = $(this).serialize();
		event.preventDefault();

		$.ajax({
			url: "/comments/",
			type: "POST",
			data: formData,
			success: function(data) {
				$comments.prepend("WE DID IT");
				$comments.prepend(format_comment(data));
			}
		})
	})
	
	var format_comment = function(data) {
		
		var comments_url = "http://localhost:3000/comments/"
		
		console.log(data);
		var comment = $("<div>", {class: "comment"})
			.attr("data-comment-id", data["id"])
			
			console.log(data["id"])
			
			var username = $("<div>", {class: "comment-username"}).html(name);
				var flair = $("<span>", {class: "flair"}).html(" ( flair goes here )");
				var likes = $("<span>", {class: "likes"});
					var circle = $("<div>", {class: "circle"})
						var votes = $("<div>", {class: "vote-count"}).html(0)
					var up = $("<i>", {class: "upvote fa fa-arrow-circle-up"}) 
					var down = $("<i>", {class: "downvote fa fa-arrow-circle-down"})
					
			var body = $("<p>", {class: "comment-body"});
				var link = $("<a>", {href: comments_url + data["id"]}).html(data["body"])
			var time = $("<span>", {class: "timestamp"}).html("Posted moments ago");
			var controls = $("<span>", {class: "controls"});
				var del = $("<a>", {href: comments_url + data["id"], "data-confirm": "Are you sure?", "data-method": "delete", rel: "nofollow"}).html("Delete")
				var reply = $("<a>", {href: comments_url + "new?parent_id=" + data["id"]}).html("Reply")

		var user_info = username.append(likes.append(circle.append(votes), up, down), flair);
		var controls_info = controls.append(del, reply);
		
		return comment.append(user_info, body.append(link), time, controls_info)
	};
	
	$comments.append(format_comment("cheese"));

	
	
	
	
	
})


// href="http://localhost:3000/comments/new?parent_id=" 11