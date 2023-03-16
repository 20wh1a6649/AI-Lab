initial([8,1,3,7,0,2,6,5,4]).
goal([1,2,3,8,0,4,7,6,5]).
operators([left, right, up, down]).
/* main procedure for breadth first
search*/
bfs(Start,Path) :-
bfs_path([node(Start,[])], Path).
/* breadth_first search*/
bfs_path([node(State,Path) | _],
Path) :-
goal(State).
bfs_path([node(State, Path) |
Queue], GoalPath) :-
findall(node(Child,PathToChild),
(apply(Operator, State, Child),
append(Path,
[Operator],PathToChild)
), ChildNodes),
append(Queue, ChildNodes,
NewQueue),
bfs_path(NewQueue, GoalPath).



move_left([X1,0,X3, X4,X5,X6,
X7,X8,X9],
[0,X1,X3, X4,X5,X6, X7,X8,X9]).
move_left([X1,X2,0, X4,X5,X6,
X7,X8,X9],
[X1,0,X2, X4,X5,X6, X7,X8,X9]).
/* move_left in the middle row */
move_left([X1,X2,X3, X4,0,X6,
X7,X8,X9],
[X1,X2,X3, 0,X4,X6, X7,X8,X9]).
move_left([X1,X2,X3, X4,X5,0,
X7,X8,X9],
[X1,X2,X3, X4,0,X5, X7,X8,X9]).
/* move_left in the bottom row */
move_left([X1,X2,X3, X4,X5,X6,
X7,0,X9],
[X1,X2,X3, X4,X5,X6, 0,X7,X9]).
move_left([X1,X2,X3, X4,X5,X6,
X7,X8,0],
[X1,X2,X3, X4,X5,X6, X7,0,X8]).
/* move_right in the top row */
move_right([0,X2,X3, X4,X5,X6,
X7,X8,X9],
[X2,0,X3, X4,X5,X6, X7,X8,X9]).
move_right([X1,0,X3, X4,X5,X6,
X7,X8,X9],
[X1,X3,0, X4,X5,X6, X7,X8,X9]).
/* move_right in the middle row */
move_right([X1,X2,X3, 0,X5,X6,
X7,X8,X9],
[X1,X2,X3, X5,0,X6, X7,X8,X9]).
move_right([X1,X2,X3, X4,0,X6,
X7,X8,X9],
[X1,X2,X3, X4,X6,0, X7,X8,X9]).
/* move_right in the bottom row*/
move_right([X1,X2,X3,
X4,X5,X6, 0,X8,X9],
[X1,X2,X3, X4,X5,X6, X8,0,X9]).
move_right([X1,X2,X3,
X4,X5,X6, X7,0,X9],
[X1,X2,X3, X4,X5,X6, X7,X9,0]).
/* move_up from the middle row
*/
move_up([X1,X2,X3, 0,X5,X6,
X7,X8,X9],
[0,X2,X3, X1,X5,X6, X7,X8,X9]).
move_up([X1,X2,X3, X4,0,X6,
X7,X8,X9],
[X1,0,X3, X4,X2,X6, X7,X8,X9]).
move_up([X1,X2,X3, X4,X5,0,
X7,X8,X9],
[X1,X2,0, X4,X5,X3, X7,X8,X9]).
/* move_up from the bottom row
*/
move_up([X1,X2,X3, X4,X5,X6,
0,X8,X9],
[X1,X2,X3, 0,X5,X6, X4,X8,X9]).
move_up([X1,X2,X3, X4,X5,X6,
X7,0,X9],
[X1,X2,X3, X4,0,X6, X7,X5,X9]).
move_up([X1,X2,X3, X4,X5,X6,
X7,X8,0],
[X1,X2,X3, X4,X5,0, X7,X8,X6]).
/* move_down from the top row */
move_down([0,X2,X3, X4,X5,X6,
X7,X8,X9],
[X4,X2,X3, 0,X5,X6, X7,X8,X9]).
move_down([X1,0,X3, X4,X5,X6,
X7,X8,X9],
[X1,X5,X3, X4,0,X6, X7,X8,X9]).
move_down([X1,X2,0, X4,X5,X6,
X7,X8,X9],
[X1,X2,X6, X4,X5,0, X7,X8,X9]).
/* move_down from the middle
row*/
 move_down([X1,X2,X3, 0,X5,X6,
X7,X8,X9],
[X1,X2,X3, X7,X5,X6, 0,X8,X9]).
move_down([X1,X2,X3, X4,0,X6,
X7,X8,X9],
[X1,X2,X3, X4,X8,X6, X7,0,X9]).
move_down([X1,X2,X3, X4,X5,0,
X7,X8,X9],
[X1,X2,X3, X4,X5,X9, X7,X8,0]).
/* Applying an operator */
apply(left,S1,S2) :-
move_left(S1,S2).
apply(right,S1,S2) :-
move_right(S1,S2).
apply(up,S1,S2) :-
move_up(S1,S2).
apply(down,S1,S2) :-
move_down(S1,S2).
