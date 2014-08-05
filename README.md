##README

#ScratchItOff

This web application is a to-do list with self-destructing posts. Simple and straightforward, and themed with Bootstrap, giving it a mobile-friendly design. 

This app requires the following Gems:

*devise
*bootstrap-sass
*pundit
*will-paginate
*whenever
*active-model-serializers


This app allows for the creation of Lists, and To-do items within the list. To-do's are destroyed after a week (using rakefile), and to-do's marked "completed" are struck-through, and then deleted using rake as well. 

Rake tasks/Chron jobs are handled in the /config/schedule.rb file when the app is hosted on a server that isn't Heroku; when run on Heroku the lib/tasks/schedule.rake file runs the tasks necessary for weekly post deletion and 'scratching-off'. Simply call the task name on Heroku's Scheduler and the tasks will execute at your designated frequency.

#API

The API for this app is accessible at 'http://api.scratchitoff.co'. Using __curl__ Post and List data are accessible to apps and available via the command line. 




