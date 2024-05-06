from .cache import temperature_for_dresden


def main() -> None:
    temp: float = temperature_for_dresden()
    print(f"Dresden, {temp}")
