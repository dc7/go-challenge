-module(test).
-import(drum, [parse/1]).
-include_lib("eunit/include/eunit.hrl").

-spec parse_test() -> boolean().

parse_test() ->
    A = #{tempo => 120.0,
          tracks => [#{id => 0, name => "kick",     notes => [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0]},
                     #{id => 1, name => "snare",    notes => [0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0]},
                     #{id => 2, name => "clap",     notes => [0,0,0,0,1,0,1,0,0,0,0,0,0,0,0,0]},
                     #{id => 3, name => "hh-open",  notes => [0,0,1,0,0,0,1,0,1,0,1,0,0,0,1,0]},
                     #{id => 4, name => "hh-close", notes => [1,0,0,0,1,0,0,0,0,0,0,0,1,0,0,1]},
                     #{id => 5, name => "cowbell",  notes => [0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0]}],
          version => "0.808-alpha"},
    B = #{tempo => 98.4000015258789,
          tracks => [#{id => 0, name => "kick",    notes => [1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0]},
                     #{id => 1, name => "snare",   notes => [0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0]},
                     #{id => 3, name => "hh-open", notes => [0,0,1,0,0,0,1,0,1,0,1,0,0,0,1,0]},
                     #{id => 5, name => "cowbell", notes => [0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0]}],
          version => "0.808-alpha"},
    C = #{tempo => 118.0,
          tracks => [#{id => 40, name => "kick",    notes => [1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0]},
                     #{id => 1,  name => "clap",    notes => [0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0]},
                     #{id => 3,  name => "hh-open", notes => [0,0,1,0,0,0,1,0,1,0,1,0,0,0,1,0]},
                     #{id => 5,  name => "low-tom", notes => [0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0]},
                     #{id => 12, name => "mid-tom", notes => [0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0]},
                     #{id => 9,  name => "hi-tom",  notes => [0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0]}],
          version => "0.808-alpha"},
    D = #{tempo => 240.0,
          tracks => [#{id => 0,   name => "SubKick",   notes => [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]},
                     #{id => 1,   name => "Kick",      notes => [1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0]},
                     #{id => 99,  name => "Maracas",   notes => [1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0]},
                     #{id => 255, name => "Low Conga", notes => [0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0]}],
          version => "0.909"},
    E = #{tempo => 999.0,
          tracks => [#{id => 1, name => "Kick",  notes => [1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0]},
                     #{id => 2, name => "HiHat", notes => [1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0]}],
          version => "0.708-alpha"},
    ?assert(parse('pattern_1.splice') == A),
    ?assert(parse('pattern_2.splice') == B),
    ?assert(parse('pattern_3.splice') == C),
    ?assert(parse('pattern_4.splice') == D),
    ?assert(parse('pattern_5.splice') == E).
