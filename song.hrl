-type song() :: #{version => string(), tempo => float(), tracks => list(track())}.
-type track() :: #{id => pos_integer(), name => string(), notes => list(1 | 0)}.