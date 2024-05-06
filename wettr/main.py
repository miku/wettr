
from xdg_base_dirs import (
        xdg_cache_home,
)

from .cache import temperature_for_dresden


def main():
    temp = temperature_for_dresden()
    print(f"Dresden, {temp}")
