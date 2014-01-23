SirfaceBook
===========

Overview
----------

This is my facebook clone, which serves to mimic facebook's core features including..

1. Posts
2. Posts with Photos
3. Profile Pictures
4. Comments
5. Likes
6. Notifications
7. Messages
8. Friending

### Languages and Technologies

This is mainly a rails app making use of :

1. Ruby
2. Active Record
3. Javascript
4. UJS
5. HTML / CSS
6. Amazon AWS
7. PostgreSQL

### Some Specifics

- used rails observer in order to track all the commits for the likes, comments, post and friendship models and created
customized messages with links with imbeded html and executed with HTML escape

- used polymorphic associations for both notifications and likes so that they could have associations with multiple tables
with the same relation

- created friendship model with an is_pending column that waits to be created and updated when a request is send and accepted, mainly to show flexibility and understanding rails models and controllers (could have also made another join table for 2 users that only held a valid friendship.)


### To Do

1. Add kaminari for infinite scroll 
2. Add some drop downs for the nav bar
3. Add omniauth gem
4. Add search capabilities for users to easily find other users walls and send messages

