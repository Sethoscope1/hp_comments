$(document).ready(function(){
	
	// ADDING TOP LEVEL COMMENT
	
	var $first = $("#first-comment");
	var $comments = $("#comments-index");
	var article = $('[name="comment[article_id]"]').val();
	var name = $('[name="user_name"]').val();
	
	$first.on("submit", function(event){
		event.preventDefault();
		formData = $(this).serialize();

		$.ajax({
			url: "/comments/",
			type: "POST",
			data: formData,
			success: function(data) {
				$comments.prepend(format_comment(data));
			}
		})
	})
	
	// ADDING COMMENT REPLY
	
	$comments.on("click", ".reply", function(event){
		event.preventDefault();
		var $reply_form = $(this).closest(".comment-pair").find(".reply-form")
		$reply_form.toggleClass("hidden");
	})
	
	$comments.on("submit", ".comment-reply", function(event){
		event.preventDefault();
		var $reply_form = $(this).closest(".comment-pair").find(".reply-form");
		formData = $(this).serialize();
		var that = this;
		
		$.ajax({
			url: "/comments/",
			type: "POST",
			data: formData,
			success: function(data) {
				$reply_form.addClass("hidden");
				var parentClass = $(that).attr("class");
				reply = format_comment(data);
				$(that).closest(".comment-pair").append((reply).addClass("nested_comment"));
			}
		})
	})
	
	$comments.on("click", ".delete", function(event){
		event.preventDefault();
		var id = $(this).closest("comment").attr("id");
	})
	
	
	var format_comment = function(data) {
		var comments_url = "/comments/";

		var comment = $("<div>", {class: "comment group"})
			.attr("data-comment-id", data["id"]);	

			
			var username = $("<div>", {class: "comment-username"}).html(name);
				var flair = $("<span>", {class: "flair"}).html(" ( flair goes here )");
				var likes = $("<span>", {class: "likes"});
					var circle = $("<div>", {class: "circle"});
						var votes = $("<div>", {class: "vote-count"}).html(0);
					var arrows = $("<div>", {class: "votes group"});
						var up = $("<i>", {class: "upvote fa fa-arrow-circle-up"});
						var down = $("<i>", {class: "downvote fa fa-arrow-circle-down"});
					
			var body = $("<p>", {class: "comment-body"});
				var link = $("<a>", {href: comments_url + data["id"]}).html(data["body"]);
			var time = $("<span>", {class: "timestamp"}).html("Posted moments ago");
			var controls = $("<span>", {class: "controls"});
				var del = $("<a>", {href: "#", class: "delete"}).html("Delete");
				var reply = $("<a>", {href: comments_url + "new?parent_id=" + data["id"]}).html("Reply");

		var user_info = username.append(flair, likes.append(circle.append(votes), arrows.append(up, down)));
		var controls_info = controls.append(del, reply);
		
		return comment.append(user_info, body.append(link), time, controls_info);
	};
	

	
	
	
	
	
})


// href="http://localhost:3000/comments/new?parent_id=" 11