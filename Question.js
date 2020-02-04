class Question {


    constructor(type, question, answer, id, difficulty) {
        this.type = type;
        this.question = question;
        this.answer = answer;
        this.id = id;
        this.difficulty = difficulty
    }

    getAnswer() {
        return this.answer;
    }
}