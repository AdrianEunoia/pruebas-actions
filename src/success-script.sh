#!/bin/bash

cat << EOF > message.json
{"@type":"MessageCard","@context":"https://schema.org/extensions","summary":"Pipeline success!","themeColor":"008000","title":"CI $GITHUB_REPOSITORY pipeline success ","sections":[{"facts":[{"name":"Repository:","value":"$GITHUB_REPOSITORY"},{"name":"Branch:","value":"$GITHUB_REF_NAME"},{"name":"By:","value":"$GITHUB_ACTOR"}]}],"potentialAction":[{"@type":"OpenUri","name":"View on GitHub","targets":[{"os":"default","uri":"$GITHUB_SERVER_URL/$GITHUB_REPOSITORY/actions/runs/$GITHUB_RUN_ID"}]}]}
EOF

curl -X POST "$WEBHOOK_TEAMS" -H 'Content-Type: application/json' -d @message.json