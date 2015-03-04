.SUFFIXES: .erl .beam

.erl.beam:
	erlc -W $<

ERL = erl -boot start_clean -pa '.'

MODS = drum cowbell test

compile: ${MODS:%=%.beam}

shell: compile
	${ERL}

test: compile
	${ERL} -noshell -eval 'eunit:test(".",[verbose])' -s init stop

clean:
	rm -rf *.beam erl_crash.dump
