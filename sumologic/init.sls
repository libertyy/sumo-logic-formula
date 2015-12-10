/etc/sumo:
  file.directory:
    - user: root
    - group: root
    - mode: 555

/etc/sumo/sources.json:
  file.managed:
    - user: root
    - group: root
    - mode: 400
    - template: jinja
    - source: salt://sumologic/files/sources.json

/etc/sumo.conf:
  file.managed:
    - user: root
    - group: root
    - mode: 400
    - template: jinja
    - source: salt://sumologic/files/sumo.config
    - requires:
      - file: /sumo

sumocollector:
  pkg.installed:
    - sources:
      - sumocollector: https://collectors.sumologic.com/rest/download/deb/64

collector:
  service.running:
    - enable: True
    - watch:
      - pkg: sumocollector
      - file: /etc/sumo.conf
      - file: /etc/sumo/sources.json
