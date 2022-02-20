import requests
import json
import os


def get_data(url: str) -> dict:
    resp = requests.get(url)
    return json.loads(resp.text)


def write_to_json(data: json, file_path: str):
    with open(file_path, "w") as f:
        f.write(json.dumps(data))


def build_file_path(file_name: str) -> str:
    return os.path.join(*["data", file_name])


def run_scrape(url: str):
    file_path = build_file_path("data.json")
    data = get_data(url)
    write_to_json(data, file_path)


if __name__ == "__main__":

    URL = "https://www.rightmove.co.uk/api/_sidebar?locationIdentifier=REGION%5E92824&radius=0.0&channel=BUY"
    run_scrape(URL)
