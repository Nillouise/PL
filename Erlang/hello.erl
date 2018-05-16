-module(hello).
fa(0)->1;
fa(N)->N*fa(N-1).


cal10(10)->
    io:format("~p~n",[10]);
cal10(X)->
    io:format("~p~n",[X]),
    cal10(X+1).

printerror({error,Message})->
    io:format("~p~n",[Message]);
printerror(success)->
    io:format("success~n").

wordCount([]) -> 0;
wordCount([32|Rest])->
    wordCount(Rest)+1;
wordCount([Charcater|Tail])->
    wordCount(Tail).

reverseList([One])->[One];
reverseList([Head|Tail])->
    reverseList(Tail) ++ [Head].


myqsort(List)->recursionSort(List).
recursionSort([])->[];
recursionSort([Mid|Tail])->
    {F,T} = putMid(Tail,Mid),
    recursionSort(F)++[Mid]++recursionSort(T).
    
% 这种写法不是尾递归
putMid([Head|Tail],Mid)->
    if
        Mid>Head->
            {Res1,Res2} = putMid(Tail,Mid),
            {Res1,[Head]++Res2};
        Mid=<Head->
            {Res1,Res2} = putMid(Tail,Mid),
            {[Head]++Res1,Res2}
    end;
putMid([],Mid)->{[],[]}.

% 这里还不知道怎么处理字符串后面的空格
trim([])->[];
trim([H|T])->
    if
        H==32 ->
            trim(T);
        true->
            [H]++[T]
    end.


main(_) ->
    io:format("~p~n",[trim(" fsdf")]),
    myqsort([]),
	io:format("Hello, World !!~n").
