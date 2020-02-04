var webSocketsServerPort = 34263;
var webSocketServer = require('websocket').server;
var http = require('http');
var server = http.createServer(function(request, response) {

});
server.listen(webSocketsServerPort, function() {
  console.log((new Date()) + " Server is listening on port "
      + webSocketsServerPort);
});

/**
* WebSocket server
*/
var wsServer = new webSocketServer({
  // WebSocket server is tied to a HTTP server. WebSocket
  // request is just an enhanced HTTP request. For more info 
  httpServer: server
});

// This callback function is called every time someone
// tries to connect to the WebSocket server
wsServer.on('request', function(request) {
    
    var connection = request.accept(null, request.origin); 
	
  //
  // New Player has connected.  So let's record its socket
  //
    var player = new Player(request.key, connection);

  //
  // Add the player to the list of all players
  //
    Players.push(player);

  //
  // We need to return the unique id of that player to the player itself
  //
    connection.sendUTF(JSON.stringify({action: 'connect', data: player.id}));

  //
  // Listen to any message sent by that player
  //
    connection.on('message', function(data) {

    //
    // Process the requested action
    //
      var message = JSON.parse(data.utf8Data);
      switch(message.action){
        //
        // When the user sends the "join" action, he provides a name.
        // Let's record it and as the player has a name, let's 
        // broadcast the list of all the players to everyone
        //
          case 'join':
            player.name = message.data;
            BroadcastPlayersList();
            break;

        //
        // When a player resigns, we need to break the relationship
        // between the 2 players and notify the other player 
        // that the first one resigned
        //
          case 'resign':
          console.log(request.key + " has exited.");
            Players.forEach(player => {
                player.connection.sendUTF(JSON.stringify({'action':'resigned'}))
            });
            break;

        //
        // A player initiates a new game.
        // Let's create a relationship between the 2 players and
        // notify the other player that a new game starts
        // 
          case 'new_game':
            player.setOpponent(message.data);
            Players[player.opponentIndex]
              .connection
              .sendUTF(JSON.stringify({'action':'new_game', 'data': player.name}));
            break;

        //
        // A player sends a move.  Let's forward the move to the other player
        //
          case 'play':
            Players[player.opponentIndex]
              .connection
              .sendUTF(JSON.stringify({'action':'play', 'data': message.data}));
            break;

        // if someone creates a game we want to send them to join the game using join_game while also sending new_game to display in the lobby for other players to see
        case 'create_game':
            let id = generateId();
            player.sendUTF(JSON.stringify({'action':'join_game', 'data': {'id':id, 'players': ''}}))
            Players.forEach(p => {
                if (p.inLobby) {
                    p.sendUTF(JSON.stringify({'action':'new_game', 'data': id}))
                }
            });
        
        // if people click a button to join we send them in

        case 'join_game':
            console.log('joinGame passed');
            console.log(player.name);
            player.connection.sendUTF(JSON.stringify({'action':'join_game', 'data': 'hi'}));
            console.log('joinGame passed 2');
            Players.forEach(p => {
                console.log(p.name)
                p.connection.sendUTF(JSON.stringify({'action':'next_question', 'data': {'question_text':'Question 1', 'answer_choices': ['a', 'b', 'c', 'd']}}));
            });
              console.log('it made it past next_question');
              
//        case 'select_answer':
//
//            // find the question set
//            let qset = QuestionSets.filter(qset => qset.id === message.data[id])[0]
//
//            //find the correct answer
//            let correctAnswer = qset[message.data[index]].getAnswer()
//
//            // see if they match 
//            let result = (correctAnswer === message.data[answer]);
//
//            // if it's right add one
//            if (result) {Scores[player.id]++}
//
//            // send the result back to the player (true or false meaning they got it right or wrong)
//            player.sendUTF(JSON.stringify({'action':'result_answer', 'data': result}));
//
//            // if they are on the last problem we need to end their game with their final score
//            if (message.data[index] === qset.length) {
//                player.sendUTF(JSON.stringify({'action':'end_game', 'data': Scores[player.id]}));
//            }
//
//            // otherwise send them the next question
//            else {
//                let nextQuestion = qset[message.data[index+1]];
//                player.sendUTF(JSON.stringify({'action':'next_question', 'data': {'question_text':nextQuestion.question, 'answer_choices': nextQuestion.answerChoices}}));
//            }
//
//            // send the opponents the results too so they can see it live
//            Players.filter(p => p.gameIndex === true).forEach(p => {
//                p.sendUTF(JSON.stringify({'action':'opponent_result', 'data': result}))
//            })

            
            
      }
    });

  // user disconnected
  connection.on('close', function(connection) {
    // We need to remove the corresponding player
    // TODO
  });
});

// -----------------------------------------------------------
// List of all players
// -----------------------------------------------------------
var Players = [];
var QuestionSets = [];
var Scores = []

function Player(id, connection){
    this.id = id;
    this.connection = connection;
    this.name = "";
    this.gameIndex = null;
    this.inLobby = true;
}


Player.prototype = {
    getId: function(){
        return {name: this.name, id: this.id};
    },
    setOpponent: function(id){
        var self = this;
        Players.forEach(function(player, index){
            if (player.id == id){
                self.opponentIndex = index;
                Players[index].opponentIndex = self.index;
                return false;
            }
        });
    }
};

// ---------------------------------------------------------
// Routine to broadcast the list of all players to everyone
// ---------------------------------------------------------
function BroadcastPlayersList(){
    var playersList = [];
    Players.forEach(function(user){
        if (user.name !== ''){
            playersList.push(user.getId());
        }
    });

    var message = JSON.stringify({
        'action': 'players_list',
        'data': playersList
    });

    Players.forEach(function(player){
        player.connection.sendUTF(message);
    });
}

function generateId() {
    let result = 0;
    for(let i = 0 ; i < 10; i++) {
        result *= 10;
        result += Math.floor(Math.random()*10);
    }

    return result;
}