from .cache import temperature_for_dresden


def main():
    temp = temperature_for_dresden()
    print(f"Dresden, {temp}")
