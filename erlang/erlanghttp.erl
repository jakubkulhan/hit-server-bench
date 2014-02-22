-module( erlanghttp ).
 
-export( [do/1, httpd_start/2, httpd_stop/1, start/0] ).
 
do( _Data ) ->
  {proceed, [{response,{200,"  "}}]}.
 
httpd_start( Port, Module ) ->
  Arguments = [{bind_address, "localhost"}, {port, Port}, {ipfamily, inet},
    {modules, [Module]},
    {server_name,erlang:atom_to_list(Module)}, {server_root,"."}, {document_root,"."}],
  {ok, Pid} = inets:start( httpd, Arguments, stand_alone ),
  Pid.
 
httpd_stop( Pid ) ->
  inets:stop( stand_alone, Pid ).
 
start() ->
  Pid = httpd_start( 8080, ?MODULE ),
  timer:sleep( 300000 ),
  httpd_stop( Pid ).