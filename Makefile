

all:	stop buildserver start

run:
	./ora.sh --start-from-git

createdb:
	./ora.sh --createemptydb OpenRobertaServer/db-2.2.7/openroberta-db

buildall: lang
	mvn -f OpenRobertaParent clean install -DskipTests

buildserver: lang
	mvn -f OpenRobertaServer install -DskipTests

stop:
	sudo service ora stop

start:
	sudo service ora start

lang:
	cd OpenRobertaServer/staticResources/blockly ; \
	~/git/blockly/i18n/create_messages.py --source_lang en --source_lang_file msg/json/en.json --source_synonym_file msg/json/synonyms.json --output_dir msg/js msg/json/it.json

