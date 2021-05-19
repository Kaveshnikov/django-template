import pytest

from example_app import models


@pytest.fixture
def example_db_suite():
    parent = models.Parent.objects.create(text='example')
    child = models.Child.objects.create(parent=parent, text='example')

    return child
