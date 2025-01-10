import time
import arrow
import humanize

def get_human_readable_time():
    """Returns the current datetime in a human-readable format."""
    now = arrow.utcnow()
    return f"{now.format('YYYY-MM-DD HH:mm:ss')} ({humanize.naturalday(now.datetime)})"

def main():
    while True:
        current_time = get_human_readable_time()
        print(f"Current DateTime (Humanized): {current_time}")
        time.sleep(1)

if __name__ == "__main__":
    main()
