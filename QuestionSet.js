class QuestionSet {
    constructor(questions, type, name) {
        this.name = name;
        this.questions = questions;
        this.type = type;
    }

    addQuestion(question) {
        this.questions.push(question);
    }

    changeQuestion(index, newQuestion) {
        this.questions.splice(index, 1, newQuestion);
    }

    changeName(newName) {
        this.name = newName;
    }
}