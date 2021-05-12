# remindmeapp

A new Flutter application.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

**1. Authentication**
There are 2 types of users. 
1) Student ,2) Club.
● While signing up we ask users whether they want to join as a student or as a club and store the details.

● And when the user sign in, we use the information that we stored while signing up and check if the
particular user is a student or a club and show the appropriate screens or details.

**2. Features**
The main idea of the app is that whenever any club posts the information (in this app) regarding the events or
any other activities, the students who subscribed to that club should get a notification and also should be able
to see the information regarding that post.

So we need to have a feature to add a post, which can be done by submitting a form.
To show the details of the posts and clubs,
There are 3 screens (look at the screenshots below)-
● In the first screen, the list of all reminders to events, posted by all the clubs that the user is subscribed
to, and the personal to-do list of each user are shown. And there should be an option to add new
events / remainders.
○ Posts related to events - When a club wants to organise a event, they add the details about the
event like the date, starting time and duration. All the posts of this type come under this screen.
○ Personal to-do list - Every student can add an event / reminder too, all these posts are also
associated with time, at which we have to remind the user. All the posts of this type also come
under this screen.
● In the second screen, the list of all the posts which are related to information sharing, posted by all the
clubs that the user is subscribed to, is shown. And there should be an option to add new posts.

○ Posts related to information sharing - Posts which are not associated with a particular time
frame (or which are not remainders). Example, if the Coding Club wants to send information that
they are floating a set of projects, and the details of the projects are also mentioned, these kinds
of posts come under this screen.

● In the third screen, the list of all the clubs should be shown. There should be an option to
subscribe/unsubscribe to the clubs that are there in the list.
