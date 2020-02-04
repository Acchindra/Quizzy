class Lobby {

    constructor(id, users, questions) {
        this.id = id;
        this.users = users;
        this.questions = questions;
        this.currentQuestion = 0;
        setTimeout(() => {
            //announce to users game is starting
            this.startGame();
        }, 30000)
    }

    addUser(user) {
        this.users.push(user);
        // send info to other users
    }

    removeUser(name) {
        for (let i = 0 ; i < this.users.length; i++) {
            if (this.users[i].getName() === name) {
                this.users.splice(i, 1);
                return;
            }
        }
        // send info to other users
    }

    startGame() {
        while (this.users.length !== 0 && this.currentQuestion < this.users.length) {
            setInterval(() => {
                nextQuestion();
                this.currentQuestion++;
            }, 30000)
        }

        this.endGame();
    }

    endGame() {

    }
}