# main.py
import time
from datetime import datetime

def main():
    while True:
        print(f"Current DateTime: {datetime.now()}")
        time.sleep(1)

if __name__ == "__main__":
    main()
