# datetime-service/python-service/datetime_service.py
import time
from datetime import datetime

def main():
    while True:
        print(f"[{datetime.now()}] DateTime Service Running...")
        time.sleep(1)

if __name__ == "__main__":
    main()

