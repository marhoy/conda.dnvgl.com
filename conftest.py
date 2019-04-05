import pytest

import restapi


@pytest.fixture
def client():
    app = restapi.create_app()
    client = app.app.test_client()
    yield client
