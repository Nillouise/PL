-module(actor).
% 这程序不能正确跑起来，新建的进程完全没有开始运行的样子。
fping(0,Res)->
    io:format("finish~n");
fping(N,Res)->
    io:format("fping~n"),
    Res ! {ping,self()},
    receive
        pong->
            io:format("receive pong~n")
    end,
    fping(N-1,Res).

%这是错的，在actor模型中，信息在函数之间的传递不是通过函数中的参数，而是通过消息 
% fpong(Res)->
%     receive
%         case ping->
%             io:format("receive pong ~n");
%     Res ! ping.
fpong()->
    io:format("fpong~n"),
    receive
        ping->
            io:format("receive ping~n")
    end.


main(_) ->
	io:format("start~n"),
    Pong = spawn(actor,fpong,[]),
    spawn(actor,fping,[4,Pong]).
