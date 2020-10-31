# Trivia

A trivia app made for Tandem apprenticeship challenge prompt. Once the user click start this app creates a round of 10 questions made from the provided questions. The user can choose one of the provided 4 or 3 answers. If correct their answer will become green, if incorrect their answer will become red and the correct will show as green. A new button (an arrow pointing to the right) will appear and the user is to click it to go to the next question.

At the end of the round the user will see their score and have an option to play another round. If all the available questions are used up then the play button is disabled and a message thanking the user for playing is displayed.

# Features
- TriviaModel singleton that handles parsing the question JSON and creating a round when the user presses start
- Navigation Controller to puse a new view controller to show a new question


# Future Implementations
- Spruce up the UI
- Change the question pool from a JSON file to a database like firebase so to add more questions I only have to add them onto firebase.
- Try to find a way so the view controller doesn't have to shuffle answers (separating responsibilities)

# Challenge Prompt

## Prompt: Tandem for 400!
At Tandem, we love to learn and have fun and what better way to do that than to play a round of trivia. One of our favorite ways to wait while our test suite is running is to hop over to the #games channel on Slack and play a quick round of trivia. Playing trivia isn’t just a fun way to learn something new but also a great way to take a little break from a normal work task.

While we’re all knowledgeable in our own right, only one person can be crowned trivia champion with the highest score. Your goal is to create an application that others will be able to use in order to help improve their trivia skills.

Train to improve your trivia knowledge by creating your own trivia training app!

## Goal
Your goal is to create an application that displays trivia questions with multiple-choice answers to select from.

Use creative license in terms of how you want us to see this game. At minimum, the player can view the question(s), the answer choices, the correct answer upon submission, and their score. It could be a user interface (UI), command-line-tool, etc. Feel free to use whatever framework or language you are comfortable with.

We would also like to see a README which includes any information about how to run the code, any known issues or complexity we should look out for, and any additional features you would like to have added to make your trivia app even more awesome.

Before you begin, familiarity with the following concepts will be helpful:
- Arrays and loops 
- Data manipulation 
- Parsing JSON

## Assumptions
- A round of trivia has 10 Questions
- All questions are multiple-choice questions
- Your score does not need to update in real time
- Results can update on form submit, button click, or any interaction you choose
- We will provide you with the trivia data such as the questions, correct and incorrect answers via a JSON file.

## Acceptance Criteria
- A user can view questions.
- Questions with their multiple choice options must be displayed one at a time. 
- Questions should not repeat in a round.
- A user can select only 1 answer out of the 4 possible answers.
- The correct answer must be revealed after a user has submitted their answer 
- A user can see the score they received at the end of the round



