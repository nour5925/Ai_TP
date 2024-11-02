% Dynamic predicates to store the tasks
:- dynamic task/4.


% Predicate to create a task
create_task(Id, Description, Assignee) :-
    assertz(task(Id, Description, Assignee, false)),
    write('Task created: '), write(Id), write('.'),
    nl.

% predicate to assign a task to a user
assign_task(Id, Assignee) :-
    retract(task(Id, Description, _, Status)),
    assertz(task(Id, Description, Assignee, Status)),
    write('Task '), write(Id),write(' assigned to user: '),
    write(Assignee), write('.'),
    nl.
% mark a task as completed
mark_completed(Id):-
    retract(task(Id, Description, Assignee,_)),
    assertz(task(Id, Description, Assignee, true)),
    write('Task '), write(Id),write(' marked as completed.'),
    nl.
% display all tasks
display_tasks :-
    task(Id, Description, Assignee, Status),
    write('Task'),write(Id),write(':'),
    nl,
    write('- Description: '),write(Description),
    nl,
    write('- Assignee: '),write(Assignee),
    nl,
    write('- Completion status: '),write(Status),
    nl,
    fail.

% display tasks based on specific filters
display_tasks_assigned_to(User) :-
    write('Tasks assigned to '),write(User),write(':'),
    nl,
    task(Id, Description, Assignee, Status),
    Assignee = User,
    write('Task '), write(Id),write(':'),nl,
    write('- Description: '),write(Description),
    nl,
    write('- Completion status: '),write(Status),
    nl,
    fail.

display_completed_tasks :-
    write('Completed tasks:'),
    nl,
    task(Id, Description, Assignee, true),
    write('Task '), write(Id),write(':'),nl,
    write('- Description:'),write(Description),
    nl,
    write('- Assignee:'),write(Assignee),
    nl,
    fail.
display_not_completed_tasks :-
    write('Not completed tasks:'),
    nl,
    task(Id, Description, Assignee, false),
    write('Task '), write(Id),write(':'),nl,
    write('- Description:'),write(Description),
    nl,
    write('- Assignee:'),write(Assignee),
    nl,
    fail.

display_task_with_id(Id) :-
    task(Id, Description, Assignee, Status),
    write('Task '), write(Id),write(':'),nl,
    write('- Description: '),write(Description),
    nl,
    write('- Assignee: '),write(Assignee),
    nl,
    write('- Completion status: '),write(Status),
    nl.


