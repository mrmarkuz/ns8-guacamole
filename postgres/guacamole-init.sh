#!/bin/bash -e

#
# Copyright (C) 2022 Nethesis S.r.l.
# SPDX-License-Identifier: GPL-3.0-or-later
#

# initialize postgres requisites

#podman run --rm guacamole/guacamole /opt/guacamole/bin/initdb.sh --postgresql > initdb.sql
psql -U postgres -d guacamole -f - < docker-entrypoint-initdb.d/data/initdb.sql

# initialize db data
#for dsql in `find docker-entrypoint-initdb.d/ /data/ -name \*.sql | sort`
#do
#    echo "Loading: $dsql ..."
#    psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" < $dsql >/dev/null
#done