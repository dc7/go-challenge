-module(cowbell).
-export([more_cowbell/1]).
-include("song.hrl").

-spec more_cowbell(song()) -> song().

more_cowbell(Song) ->
    maps:update(tracks, lists:map(fun add_cowbell/1, maps:get(tracks, Song)), Song).

add_cowbell(Track) ->
    case maps:get(name, Track) of
        "cowbell" -> maps:update(notes, random_notes(), Track);
        _ -> Track
    end.

random_notes() ->
    lists:map(fun random_note/0, lists:seq(1, 16)).

random_note() ->
    N = random:uniform(),
    if
        N < 0.25 -> 0;
        true -> 1
    end.
