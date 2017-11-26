#!/bin/bash

openssl req \
	-x509 \
	-newkey rsa:4096 \
	-keyout /opt/SOURCES/cuberite/Server/webadmin/httpskey.pem \
	-nodes \
	-out /opt/SOURCES/cuberite/Server/webadmin/httpscert.crt \
	-days 365 \
	-subj '/CN=localhost'

