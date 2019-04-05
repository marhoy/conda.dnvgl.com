
def test_root(client):
    response = client.get("/")
    assert response.status_code == 404


def test_ui(client):
    response = client.get("/ui/")
    assert response.status_code == 200


def test_conda_index(client):
    response = client.get("/conda_index")
    assert response.status_code == 200
