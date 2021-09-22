import connexion;
from connexion.exceptions import OAuthProblem

TOKEN_DB = {
    'special-key': {
        'uid': 100
    }
}

def apikey_auth(token, required_scopes):
    info = TOKEN_DB.get(token, None)

    if not info:
        raise OAuthProblem('Invalid token')

    return info


def get_secret(user) -> str:
    return f"You are {user} and the secret is 'wbevuec'"