---
title: NGINX
subtitle: Dinge die ich im Laufe der Zeit über NGINX lerne.
---

Dieser Server sammelt keinerlei Logs. Damit das so bleibt, deaktivierte ich alle logs in meiner Server-Konfiguration.

```json
server dadda.moe {
    access_log off;
    error_log /dev/null;
}
```

Diese Vorgehensweise ist das Ergebnis meiner Auswertung [dieser Stackoverflow-Diskussion](https://serverfault.com/questions/318574/how-to-disable-nginx-logging)
