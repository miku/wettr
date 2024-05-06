import pytest

from .fahrenheit import c_to_f, f_to_c


def test_c_to_f():
    """
    Either use plain asserts.
    """
    assert c_to_f(0) == 32
    assert c_to_f(10) == 50


@pytest.mark.parametrize("f,expected", [(32, 0), (212, 100)])
def test_f_to_c(f, expected):
    """
    Or parameterize for more "table-driven tests".
    """
    assert f_to_c(f) == expected
