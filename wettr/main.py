
from xdg_base_dirs import (
        xdg_cache_home,
)

def main():
    print("hello, world!")
    print(f"api responses cached under: {xdg_cache_home()}")
