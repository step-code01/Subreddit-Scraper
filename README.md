# Website Image Scraper 

Have you ever encounter a time when you need a dataset for a ML model and you couldn't find one standard sources like kaggle?

I encountered this problem in a Hackathon when I needed a dataset to train a ML model regarding fitness transformation of people 
and didn't get any results. Luckily enough, I interestingly found the data that'd work on a technically unconventional site 
called "Reddit".

To download these huge amount of images individually one by one would have taken insane amount of time, so I just automated it
and saved time via bash scripts. 

Here, in this example 
I have used r/pics as the choice of subreddit. 
To download Top 10 images sorted by top of all time giving me the url https://www.reddit.com/r/pics/top/?t=all 

To make it work as intended the workaround I used is that, 
you need to set the User Agent 
