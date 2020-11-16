#!/bin/bash

rm -f patient.csv
wget https://www.pref.kanagawa.jp/osirase/1369/data/csv/patient.csv
iconv -f sjis -t utf-8 patient.csv > patient.csv.u
perl district.pl < patient.csv.u > date_district_diff.csv

