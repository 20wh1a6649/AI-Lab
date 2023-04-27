water_jug(X,Y):-X>4,Y<3,write('4l water jug overflowed.'),nl.
water_jug(X,Y):-X<4,Y>3,write('3l water jug overflowed.'),nl.
water_jug(X,Y):-X>4,Y>3,write('both water jugs overflowed.'),nl.

water_jug(X,Y):-(X==0,Y==0,nl,write('4l:0&3l:3(Action:fill 3l jug.)'),YY is 3,water_jug(X,YY));

( X==0,Y==0,nl,write('4l:4&3l:0(Action:fill 4l jug.)'),XX is 4,water_jug(XX,Y));
( X==2,Y==0,nl,write('4l:2&3l:0(Action:Goal state reached...)'));
( X==4,Y==0,nl,write('4l:1&3l:3(Action:Pour water from 4l to 3l jug.)'),XX is X-3,YY is
3,water_jug(XX,YY));
( X==0,Y==3,nl,write('4l:3&3l:0(Action:Pour water from 3l to 4l jug)'),XX is 3,YY is
0,water_jug(XX,YY));
( X==1,Y==3,nl,write('4l:1&3l:0(Action:Empty 3l jug.)'),YY is 0,water_jug(X,YY));
( X==3,Y==0,nl,write('4l:3&3l:3(Action:fill 3l jug.)'),YY is 3,water_jug(X,YY));
( X==3,Y==3,nl,write('4l:4&3l:2(Action:Pour water from 3l jug to 4l jug until jug is full.)'),XX
is X+1,YY is Y-1,water_jug(XX,YY));
( X==1,Y==0,nl,write('4l:0&3l:1(Action:Pour water from 4l jug to 3l jug.)'),XX is Y,YY is
X,water_jug(XX,YY));
( X==0,Y==1,nl,write('4l:4&3l:1(Action:fill 4l jug.)'),XX is 4,water_jug(XX,Y));
( X==4,Y==1,nl,write('4l:2&3l:3(Action:Pour water from 4l jug to 3l jug until 3l jug is
full.)'),XX is X-2,YY is Y+2,water_jug(XX,YY));
( X==2,Y==3,nl,write('4l:2&3l:0(Action:Empty 3l jug.)'),YY is 0,water_jug(X,YY));
( X==4,Y==2,nl,write('4l:0&3l:2(Action:Empty 4l jug.)'),XX is 0,water_jug(XX,Y));
( X==0,Y==2,nl,write('4l:2&3l:0(Action:Pour water from 3l jug to 4l jug.)'),XX is Y,YY is
X,water_jug(XX,YY)).
