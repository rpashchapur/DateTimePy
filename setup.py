# setup.py
from setuptools import setup

setup(
    name="datetime-service",
    version="0.1.0",
    py_modules=["main"],
    entry_points={
        "console_scripts": [
            "datetime-service=main:main",
        ]
    }
)
