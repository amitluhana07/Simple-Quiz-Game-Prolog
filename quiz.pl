% Simple Quiz Game in Prolog
% Questions and correct answers
question(1, 'Capital of India?', delhi).
question(2, '2 + 2 = ?', 4).
question(3, 'Color of grass?', green).
question(4, 'How many days in a week?', 7).
question(5, 'Which planet is called the Red Planet?', mars).
% Start the quiz
start :-
    writeln('===== SIMPLE QUIZ GAME ====='),
    writeln('Enter your answer followed by a period.'),
    nl,
    quiz(1, 0, Score),
    nl,
    format('Your final score: ~w/5~n', [Score]),
    writeln('Thank you for playing!').
% Ask questions one by one
quiz(N, Score, FinalScore) :-
    question(N, Q, A),
    !,
    format('Q~w. ~w~nYour answer: ', [N, Q]),
    read(X),
    ( X == A ->
        writeln('Correct!'),
        NewScore is Score + 1
    ;
        format('Wrong! Correct answer: ~w~n', [A]),
        NewScore = Score
    ),
    nl,
    Next is N + 1,
    quiz(Next, NewScore, FinalScore).
% Stop after all questions
quiz(N, Score, Score) :-
    \+ question(N, _, _).
