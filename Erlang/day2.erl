-module(day2).

getVal([],Key)->nil;
getVal([{Key,Val}|_],Key)->
    Val;
getVal([{Other,Nxt}|Tail],Key)->
    getVal(Tail,Key).


myprint2([])->nil;
myprint2([{Key,Val}|Tail])->
    io:format("~p ~p~n",[Key,Val]),
    myprint2(Tail).

getIndex([Val|Tail],0)->Val;
getIndex([Val|Tail],X)->
    getIndex(Tail,X-1).

checkFull([])->true;
checkFull([A|T])->
    if
        A == e andalso  A==e ->
            false;
        true->
            checkFull(T)
    end.

%最终这个判断三子棋胜负的程序我还是做不出来
% 这么写压根不是函数式，压根没用模式匹配
checkLine(List,X)->
    getIndex(List,0),
    if
        % 下面三句判断横向
        % getIndex(List,0)==X andalso getIndex(List,1)==X andalso getIndex(List,2)==X ->
        getIndex(List,0)>0->
            true;
        getIndex(List,3)==X andalso getIndex(List,4)==X andalso getIndex(List,5)==X ->
            true;
        getIndex(List,6)==X andalso getIndex(List,7)==X andalso getIndex(List,8)==X ->
            true; 
        % 下面三句判断众向
        getIndex(List,0)==X andalso getIndex(List,3)==X andalso getIndex(List,6)==X ->
            true;
        getIndex(List,1)==X andalso getIndex(List,4)==X andalso getIndex(List,7)==X ->
            true;
        getIndex(List,2)==X andalso getIndex(List,5)==X andalso getIndex(List,8)==X ->
            true;
        % 下面三句判断对角
        getIndex(List,0)==X andalso getIndex(List,4)==X andalso getIndex(List,8)==X ->
            true;
        getIndex(List,2)==X andalso getIndex(List,4)==X andalso getIndex(List,6)==X ->
            true;
        true->
            false
        end.

functionCheck([])->false;
functionCheck([X,X,X|T])->
    case X of
        e->functionCheck(T);
        _->_
    end.
functionCheck(X,)


% 
% check(Maze)->
%     if
%         checkFull(Maze) ->
%             cat;
%         checkLine(Maze,x)->
%             x;
%         checkLine(Maze,o)->
%             o;
%         true->
%             no_winner
%     end.
% 



main(_) ->
    % Dat = [{fffd,"fffdf"},{erlang,"fdsfds"},{fff,"fffdf"}],
    checkFull([]),
    A= [{Item,Quantity*Price}||{Item,Quantity,Price}<-[{"fdf",10,20}]].
    % io:format("~p~n",checkFull([e])),
    % io:format("~p~n",check([x,o,x,o,x,o,x,o,x]))