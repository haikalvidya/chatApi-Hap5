# chatApi-Hap5

The project provide backend functionality for basic the chat. Project consists in three main parts: Users, Chat Room and Message

## Initialization

### Installation
```bundle install```

### Run Migration
```rails db:migrate```

### Load Initial Data
```rails db:seed```

### Run App
``` rails s```

## Workflow to test
Create Users to chat each others.

```curl -i -X POST -H "Content-Type:application/json" http://localhost:3000/users -d '{"name": "test", "email": "test@test.com"}'``` 

In this project, if you have Load Init Data, then several users already exist. User list can be displayed with the following request.

```curl http://localhost:3000/users```

Before sending a message need to create a Chat Room.

```curl -i -X POST -H "Content-Type:application/json" http://localhost:3000/chat_rooms -d '{"title": "Friend", "created_id": 1, "sender_id": 1, "recipient_id": 2}'``` 

The above request creates a Chat Room for user_id=1 and user_id=2. After that compose a message or send a message.

```curl -i -X POST -H "Content-Type:application/json" http://localhost:3000/chat_rooms/1/messages -d '{"body": "This is new message", "user_id": 1}'``` 

To see all messages that have ever been sent, you can see with the following request.

```http://localhost:3000/chat_rooms/1/messages```

```http://localhost:3000/chat_rooms/:chat_room_id/messages```

## Basic API Functionality The Project

### Users

#### Get Users
```curl http://localhost:3000/users```

#### Show User
```curl http://localhost:3000/users/1```

#### Search Users
This is use for asyncronous search of users. In case it doesn't find any user will return empty array `[]`.
```curl http://localhost:3000/users/search?name=admin&email=admin@admin.com```

#### Fetch User
This is use to search an user that is suppose to exists. If it doesn't find any will throw an exception.
```http://localhost:3000/users/fetch?name=admin&email=admin@admin.com```

#### Create User
```curl -i -X POST -H "Content-Type:application/json" http://localhost:3000/users -d '{"name": "test", "email": "test@test.com"}'``` 

#### Update User
```curl -i -X PUT -H "Content-Type:application/json" http://localhost:3000/users/1 -d '{"name": "test2", "email": "test2@test.com"}'``` 

#### Delete User
```curl -i -X DELETE http://localhost:3000/users/1``` 

### Chat Rooms

#### Get Chat Rooms
```curl http://localhost:3000/chat_rooms```

#### Show Chat Room
```curl http://localhost:3000/chat_rooms/1```

#### Search Chat Rooms
This is use for asyncronous search of users. In case it doesn't find any user will return empty array `[]`.
```curl http://localhost:3000/chat_rooms/search?title=Sport```

#### Create Chat Room
```curl -i -X POST -H "Content-Type:application/json" http://localhost:3000/chat_rooms -d '{"title": "games", "created_id": 1, "sender_id": 1, "recipient_id": 1}'``` 

#### Update Chat Room
```curl -i -X PUT -H "Content-Type:application/json" http://localhost:3000/chat_rooms/1 -d '{"title": "games", "created_id": 1, "sender_id": 1, "recipient_id": 1}'``` 

#### Delete Chat Room
```curl -i -X DELETE http://localhost:3000/chat_rooms/1``` 

### Messages

#### Get Messages
```http://localhost:3000/chat_rooms/1/messages```

#### Show Message
```http://localhost:3000/chat_rooms/1/messages/2```

#### Create Message
```curl -i -X POST -H "Content-Type:application/json" http://localhost:3000/chat_rooms/1/messages -d '{"body": "very long text", "user_id": 1}'``` 

#### Update Message
```curl -i -X PUT -H "Content-Type:application/json" http://localhost:3000/chat_rooms/1/messages/1 -d '{"body": "very long text", "user_id": 1}'``` 

#### Delete Message
```curl -i -X DELETE http://localhost:3000/chat_rooms/1/messages/1``` 
