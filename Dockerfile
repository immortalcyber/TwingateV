USER root

COPY nginx.conf /etc/nginx/nginx.conf
COPY config.json ./
COPY entrypoint.sh ./

RUN apt-get update && apt-get install -y
docker run -d --sysctl net.ipv4.ping_group_range="0 2147483647" --env TENANT_URL="https://immortalcyber.twingate.com" --env ACCESS_TOKEN="eyJhbGciOiJFUzI1NiIsImtpZCI6IlM1WjRzUHkwVWc0NXpQUWlYT1VYalRCVkZrXzhTd0kxS2xBeGRLQUxPR3MiLCJ0eXAiOiJEQVQifQ.eyJudCI6IkFOIiwiYWlkIjoiNTI0MTEiLCJkaWQiOiI1MTMxMDkiLCJqdGkiOiIzMzAxZDA0MC0yZDY1LTQwODItYjRlMC0wMGY5ZGQ4NDM3MzMiLCJpc3MiOiJ0d2luZ2F0ZSIsImF1ZCI6ImltbW9ydGFsY3liZXIiLCJleHAiOjE2ODI3MDY1NDQsImlhdCI6MTY4MjcwMjk0NCwidmVyIjoiNCIsInRpZCI6IjE4MzIwIiwicm53IjoxNjgyNzAzMjQ0LCJybmV0aWQiOiIyNTc1MiJ9.qV7o0MFuKe09Ee-xUgnQ2S5a13h_wZvDQlmkDFRg6eEbGsOPI8nNiqmU8bD1jtzBq1LqnhQdaqosagoDR9GUVA" --env REFRESH_TOKEN="KTolyGvpTRMmLtU4o0ScFPxsPiCV6yONUh987-jk6pSOP3IiT0H8LSanzUJWd-GOEHp6FqF0saAc60AAfUE1O6Fo9bWgBGvlaR2cryXDSU3PoMkz07_pAR51vjiYM26R5sU8kA"  --env TWINGATE_LABEL_HOSTNAME="`hostname`" --name "twingate-neon-harrier" --restart=unless-stopped $(docker run --help | grep -- --pull >/dev/null && echo "--pull=always") twingate/connector:1
