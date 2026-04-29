#!/bin/bash
su - db2inst1 << 'EOF'
db2 connect to BLUDB
db2 "SELECT * FROM EDC_INST1.OMNIO_DB_INSTALLATION2_PROFILES ORDER BY ID"
db2 terminate
EOF

# Made with Bob
