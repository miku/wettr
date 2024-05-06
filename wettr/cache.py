from xdg_base_dirs import (
    xdg_cache_home,
)
import os
import requests
import json
import time

# curl "https://api.open-meteo.com/v1/forecast?latitude=52.52&longitude=13.41&current=temperature_2m,wind_speed_10m&hourly=temperature_2m,relative_humidity_2m,wind_speed_10m"


def fetch_openmeteo(lat=51.0504, long=13.7373):
    params = {
        "latitude": lat,
        "longitude": long,
        "current": "temperature_2m,wind_speed_10m",
    }
    resp = requests.get("https://api.open-meteo.com/v1/forecast", params=params)
    if resp.status_code != 200:
        raise RuntimeError(f"could not fetch open meteo API: {resp.status}")
    return resp.json()


def weather_for_dresden(max_age_s=300):
    """
    Returns a recent weather report in JSON from open meteo API.
    """
    cachefile = os.path.join(xdg_cache_home(), "wettr", "dresden.json")
    os.makedirs(os.path.dirname(cachefile), exist_ok=True)
    if (
        not os.path.exists(cachefile)
        or (time.time() - os.path.getmtime(cachefile)) > max_age_s
    ):
        with open(cachefile, "w") as f:
            json.dump(fetch_openmeteo(), f)
    with open(cachefile) as f:
        return json.load(f)


def temperature_for_dresden(max_age_s=300):
    weather_resp = weather_for_dresden(max_age_s)
    return weather_resp["current"]["temperature_2m"]
