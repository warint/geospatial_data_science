#!/usr/bin/env python3
"""
Fetch World Bank internet-use data for selected countries.
Run this script outside the ChatGPT sandbox in a normal environment with internet access:
    python scripts/fetch_worldbank_internet_users.py
"""
import pandas as pd
import requests

COUNTRIES = "ER;SD;ET;DJ;SO;YE;SA;EG;KE;RW;GH"
INDICATOR = "IT.NET.USER.ZS"
URL = f"https://api.worldbank.org/v2/country/{COUNTRIES}/indicator/{INDICATOR}?format=json&per_page=20000"

r = requests.get(URL, timeout=30)
r.raise_for_status()
records = r.json()[1]
rows = []
for rec in records:
    if rec.get("value") is not None:
        rows.append({
            "iso3": rec["countryiso3code"],
            "country": rec["country"]["value"],
            "year": int(rec["date"]),
            "indicator": INDICATOR,
            "internet_users_percent": float(rec["value"]),
        })
out = pd.DataFrame(rows).sort_values(["country", "year"])
out.to_csv("data/worldbank_internet_users_selected.csv", index=False)
print("Wrote data/worldbank_internet_users_selected.csv")
