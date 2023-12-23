"""
Web Application using Flask
"""

from flask import Flask, render_template
from flask_bootstrap import Bootstrap

app = Flask(__name__)
Bootstrap(app)

# Sample user data
users = [
    {"id": 1,
     "username": "john_doe", 
     "first_name": "John", 
     "last_name": "Doe", 
     "email": "john@example.com"},

    {"id": 2,
     "username": "jane_smith", 
     "first_name": "Jane", 
     "last_name": "Smith", 
     "email": "jane@example.com"},

    {"id": 3,
     "username": "bob_jones", 
     "first_name": "Bob", 
     "last_name": "Jones", 
     "email": "bob@example.com"},

    {"id": 4,
     "username": "alice_wonder", 
     "first_name": "Alice", 
     "last_name": "Wonder", 
     "email": "alice@example.com"},
]

@app.route('/')
def home():
    """
    Render home page with a list of users.
    """
    return render_template('home.html', users=users)

@app.route('/profile/<username>')
def profile(username):
    """
    Render profile page for a specific user.
    """
    user = next((user for user in users if user["username"] == username), None)
    if user:
        return render_template('profile.html', user=user)
    return 'User not found', 404

if __name__ == '__main__':
    app.run(debug=True)
