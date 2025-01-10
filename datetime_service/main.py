import time
from datetime import datetime
import requests
import pytz

def get_ip_info():
    """Fetch IP information using an external API."""
    try:
        response = requests.get("https://api.ipify.org?format=json")
        response.raise_for_status()
        data = response.json()
        return data.get("ip", "Unknown IP")
    except requests.RequestException as e:
        return f"Error fetching IP: {e}"

def main():
    timezone = pytz.timezone("Asia/Kolkata")  # Using pytz for timezone management
    while True:
        now = datetime.now(timezone).isoformat()
        ip_address = get_ip_info()
        print(f"Current DateTime: {now}, IP Address: {ip_address}")
        time.sleep(1)

if __name__ == "__main__":
    main()
