-module(erlanghttp).
 
-export([start/0, do/1]).
 
get_timestamp() ->
  erlang:system_time(millisecond).

do(_Data) ->
  {proceed, [{response, {200, integer_to_list(get_timestamp())}}]}.

httpd_start(Port, Module) ->
  Arguments = [
    {bind_address, "localhost"},
    {port, Port},
    {ipfamily, inet},
    % Send small responses immediately before filling full packet. See gen_tcp(3erl).
    {socket_type, {ip_comm, [{nodelay,true}]}},
    {modules, [Module]},
    {server_name, erlang:atom_to_list(Module)},
    {server_root, "."},
    {document_root, "."},
    % No significant performance change, but less variability.
    {server_tokens, none}
  ],
  {ok, Pid} = inets:start(httpd, Arguments, stand_alone),
  Pid.

httpd_stop(Pid) ->
  inets:stop(stand_alone, Pid).

start() ->
  Pid = httpd_start(8080, ?MODULE),
  timer:sleep(300000),  % 300 seconds.
  httpd_stop(Pid).
