class User {
    constructor(name) {
        this.name = name;
        this.score = 0;
    }

    addScore(amount) {
        this.score += amount;
        //update other users
    }

    getName() {
        return this.name;
    }

    changeName(newName) {
        this.name = newName;
    }
}