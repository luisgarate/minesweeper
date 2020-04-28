# README - Minesweeper challenge
### Requirements
- DB: Postgres 
- Set the DB: `rake db:create db:migrate`
- Run the server locally: `rails server`

### Considerations
* The time spent on this challenge was 5 hours (requirement of the original README).
* The Board is represented as an Array of Array (easy to access and small time consuming).

### Routes

**POST**   `/api/v1/boards/:id/discover`
> Discover a tile of the board, need two coordinates on the body of the message
> *Request body*: `{x: 3, y:  6}`
> *Response*: `{mine: true}`

**CRUD operations**                                                   
**GET**    `/api/v1/boards`                                                                
> Returns all the boards
>  
**POST**   `/api/v1/boards`                                                                 
> Create a new board with specific dimensions
> *Request body*: `{width: 4, height: 8}`
> 
**GET**    `/api/v1/boards/:id`                                                             
> Shows the specific board with the mine_board also
> *Response*:
>
 `{"board":{"id":1,
          "width":5,
          "height":4,
          "field":[[" ","x","x"," "," "],
                   ["x"," ","x","x"," "],
                   ["x","x"," "," ","x"],
                   ["x","x"," "," "," "]],
          "created_at":"2020-04-26T23:51:19.505Z",
          "updated_at":"2020-04-26T23:51:19.505Z"},
` `"mine_board":[[2,-1,-1,3,1],
               [-1,6,-1,-1,2],
               [-1,-1,4,3,-1],
               [-1,-1,2,1,1]]
}`
 
**PATCH**  `/api/v1/boards/:id`                                                             
> Updates a board
>
**DELETE** `/api/v1/boards/:id`                                                             
> Deletes a board
