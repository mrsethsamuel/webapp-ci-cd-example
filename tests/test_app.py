"""
Tests for the Flask application.
"""

import pytest
from app.app import app

@pytest.fixture(name="test_client")
def setup_test_client():
    """
    Create a test client instance for the Flask app.
    """
    return app.test_client()

def test_home(test_client):
    """
    Test the home route of the app.
    """
    response = test_client.get('/')
    assert response.status_code == 200
    assert b'John' in response.data

def test_profile(test_client):
    """
    Test the profile route of the app.
    """
    response = test_client.get('/profile/john_doe')
    assert response.status_code == 200
    assert b'John Doe' in response.data
