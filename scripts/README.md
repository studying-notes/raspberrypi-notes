
```bash
crontab -e
```

```bash
# 25 14 * * mon /usr/bin/docker restart gitea

5 1 * * * /bin/bash /root/projects/scripts/cron/morning.sh
25 14 * * mon /bin/bash /root/projects/scripts/cron/weekly.sh
30 17 * * * /bin/bash /root/projects/scripts/cron/evening.sh
```
