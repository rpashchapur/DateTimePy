import time
from datetime import datetime

def main():
    while True:
        print(f"Current DateTime: {datetime.now().isoformat()}")
        time.sleep(1)

if __name__ == "__main__":
    main()
