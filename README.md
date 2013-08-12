## CoderMatch

### Live page (work in progress): [http://codermatch.me](http://codermatch.me)

### What does this app do?

Lets you find local coders to pair program with.

### APIs used:
[Hull.io](http://hull.io) for GitHub login and other social features

### Key gems used:
* will_paginate
* Geocoder
* Google Maps for Rails (gmaps4rails)

### How this app works:
1. Log in with GitHub
2. Set you programming language and level
3. Set the language and level of the person you want to pair program with
4. Enter your zip code
5. See nerd(s) in your area that you can pair program with
6. Email them or visit their profile and send them a comment on their wall
6. If no one is able to program with you locally, you can see a list of users who are able to pair program remotely
7. If no one is availalbe to pair program with you remotely, you can sign up to be notified when someone becomes available.

### Challenges we faced:
* Combining Hull.io GitHub login in the creation of a new user
* Using Arbiter / Presenter design pattern to create and save a new user and search for a pair programming buddy
* Adding a hidden field to our sign-up form in order to protect from forgery since we're not using Rails form helpers

### Special thanks to:
[Stephane Bellity](https://github.com/sbellity) - for the best tech support
[Keith Gaddis](https://github.com/karmajunkie) - for being an awesome backend mentor
[Johnathon E. Wright](https://github.com/mustmodify) from [Rails Hotline](http://rails.pockethotline.com) - for getting us through the initial hump
[Elyse Holladay](http://www.elyseholladay.com) - for being our "sassy" frontend mentor