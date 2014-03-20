ACHIEVEMENT UNLOCKER
===

HuffPost EDITION
---

<hr />

http://hp-comments.herokuapp.com/#/

<hr />

## What is it?

It's a commenting & voting system with video game style 'achievements' to encourage meaningful interactions between the site's visitors.

### What's the Big Idea?

Our online interactions tend to be incredibly short-lived. Whatever pithy, thoughtful, or humorous insight we make today isn't worth much tomorrow. 

Applying video game style achievements to your comment system could encourage users both to be more participative and to be more cognizant of the ways they interact online. Likewise, it would give you the opportunity to cultivate the kinds of conversations you'd like to see in your forums. 

While comments on political sites tend to be terse and one-sided, rewards could be used to encourage new behaviors.

### Achievements 

<hr />

* Controversy achievements reward viewers that take more difficult positions
* Thumbs Up & Aww, Snap!! badges encourage people to upvote and downvote posts
* Popular Poster congratulates users who write comments that recieve a lot of votes from their peers
* Future Novelist & Thoughtful Poster encourage longer, more thought out posts

### How To

<hr />

Log In by entering your name and a password. Navigate to the articles by clicking on the photos and headlines in the center of the screen.

Posting comments, giving, and recieving votes will earn you achievements. Along the right is a 'cheat sheet' for how to unlock each of the achievements, and a glimpse at how awesome you'll feel when you earn them.

### New Technologies

#### AngularJS
I decided to give AngularJS a go, after I built a fully functioning site in Rails. Bad decision on my part, since I didn't think about how much heavy lifting I was doing through Active Record associations. 

I had to do a little wrangling to make it work. Where I had pre-fetched a lot of data with :include (e.g., including comments when I hit the database for an article's info) in the Rails app, I had to make some painful choices with Angular - either adding columns to the database (as with comments' authors' names), or making multiple queries and then processing the data (articles and their comments).

Some of these choices were painful, but it was a great learning process.

#### Twitter Bootstrap
I don't know how I avoided it for so long (I like styling), but this was my first time with Twitter Bootstrap as well. It's great once you realize that it's better to just go along with their design choices than to fuss with it.

### Todo
Threaded Comments - I had this up and running in Rails, but will try to get it rolling again on angular.

More Badges - I made some test cases to make sure everything works, but it could use some more robust interactions.

User Flair in the sidebar! It would be cool if you could see which badges users had earned when they leave a comment.

