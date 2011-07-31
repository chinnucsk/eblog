LIBS := lib/misultin/ebin lib/mustache/ebin lib/erlmarkdown/ebin
compile:
	./rebar compile
	cd lib/erlmarkdown/; ../../rebar compile
	make -C lib/misultin all
	make -C lib/mustache all
	cp templates/*.mustache ebin
clean:
	./rebar clean
	cd lib/erlmarkdown/; ../../rebar clean
	make -C lib/misultin clean
	-rm lib/mustache/ebin/*

run: compile
	erl -pa ebin $(LIBS)

start: compile
	erl -pa ebin $(LIBS) -eval "application:start(eblog)."
