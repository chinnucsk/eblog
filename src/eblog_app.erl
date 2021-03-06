% ==========================================================================================================
% MISULTIN - Example: Application based on Misultin - MAIN APPLICATION
%
% >-|-|-(°>
% 
% Copyright (C) 2011, Roberto Ostinelli <roberto@ostinelli.net>, Example taken from
%                     <http://www.zeitoun.net/articles/comet_and_php/start>
% All rights reserved.
%
% BSD License
% 
% Redistribution and use in source and binary forms, with or without modification, are permitted provided
% that the following conditions are met:
%
%  * Redistributions of source code must retain the above copyright notice, this list of conditions and the
%    following disclaimer.
%  * Redistributions in binary form must reproduce the above copyright notice, this list of conditions and
%    the following disclaimer in the documentation and/or other materials provided with the distribution.
%  * Neither the name of the authors nor the names of its contributors may be used to endorse or promote
%    products derived from this software without specific prior written permission.
%
% THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED
% WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
% PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR
% ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED
% TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
% HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
% NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
% POSSIBILITY OF SUCH DAMAGE.
% ==========================================================================================================
-module(eblog_app).
-behaviour(application).

% application callbacks
-export([start/2, stop/1]).

% ============================ \/ API ======================================================================

% ============================ /\ API ======================================================================


% ============================ \/ APPLICATION CALLBACKS ====================================================

% ----------------------------------------------------------------------------------------------------------
% Function: -> {ok, Pid} | {ok, Pid, State} | {error, Reason}
% Description: Starts the application
% ----------------------------------------------------------------------------------------------------------
start(_Type, _StartArgs) ->
    % start main application supervisor
    db:start(),
    Options = [
               {port, 8080},
               {loop, fun(Req) -> web_srv:handle_http(Req:get(method), Req:resource([lowercase, urldecode]), Req) end}
              ],
    eblog_sup:start_link(Options).

% ----------------------------------------------------------------------------------------------------------
% Function: stop(State) -> void()
% Description: Stops the application
% ----------------------------------------------------------------------------------------------------------
stop(_State) ->
    ok.

% ============================ /\ APPLICATION CALLBACKS ====================================================


% ============================ \/ INTERNAL FUNCTIONS =======================================================

% ============================ /\ INTERNAL FUNCTIONS =======================================================    
