import pytest

from uv_app.example_util import addition


@pytest.mark.parametrize(
    ("a", "b", "expected"),
    [
        (2, 3, 5),
        (1.5, 2.5, 4.0),
        (-1, 1, 0),
    ],
)
def test_addition_returns_sum(a: float, b: float, expected: float) -> None:
    assert addition(a, b) == expected
