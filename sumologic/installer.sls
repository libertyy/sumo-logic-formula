/opt/SumoCollector:
  file.directory:
    - user: root
    - group: root
    - mode: 555

/sumo:
  file.directory:
    - user: root
    - group: root
    - mode: 555

sumologic_installer:
  file.managed:
    - name: /opt/sumo64.sh
    - source: https://collectors.sumologic.com/rest/download/linux/64
    - source_hash: md5=dbfb5d2fa28def263b9560a7f9e2f19a
    - user: root
    - group: root
    - mode: 544

  cmd.run:
    - name: /opt/sumo64.sh -q
    - cwd: /opt/SumoCollector
    - creates: /opt/SumoCollector/collector
    - requires:
      - file: /opt/sumo64.sh
      - file: /opt/SumoCollector