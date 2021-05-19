import pytest

from example_app import models

pytestmark = pytest.mark.django_db


def test_example(example_db_suite):
    child = example_db_suite
    assert models.Child.objects.count() == 1
    child = models.Child.objects.get(pk = child.id)
    assert child is not None
    assert child.text == 'example'

