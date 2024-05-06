from .cache import temperature_for_dresden
from .fahrenheit import c_to_f


def main() -> None:
    temp: float = temperature_for_dresden()
    print(f"Dresden, {temp}C / {c_to_f(temp)}F")
