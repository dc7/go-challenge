-module(drum).
-export([parse/1]).
-include("song.hrl").

-spec parse(file:name_all()) -> song().

parse(Filename) ->
    parse_song(element(2, file:read_file(Filename))).

parse_song(<<"SPLICE",
             _Skip:8/binary,
             Version:32/binary,
             Tempo:4/binary,
             Tracks/binary>>) ->
    #{version => binary_to_list(trim(Version)),
      tempo => parse_float32(Tempo),
      tracks => parse_tracks(Tracks)}.

parse_tracks(<<>>) -> [];
parse_tracks(<<Id:4/binary,
               Length:8/integer,
               Name:Length/binary,
               Notes:16/binary,
               Rest/binary>>) ->
    Track = #{id => binary:decode_unsigned(Id, little),
              name => binary_to_list(Name),
              notes => binary_to_list(Notes)},
    [Track | parse_tracks(Rest)].

parse_float32(Binary) ->
    <<Tempo:32/float>> = list_to_binary(lists:reverse(binary_to_list(Binary))), Tempo.

trim(Binary) ->
    binary:replace(Binary, <<0>>, <<>>, [global]).
