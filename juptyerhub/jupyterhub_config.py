# use github authenticator
from oauthenticator.github import GitHubOAuthenticator
c.JupyterHub.authenticator_class = GitHubOAuthenticator

# specify users and admin
c.Authenticator.whitelist = {'derekpedersen'}
c.Authenticator.admin_users = {'derekpedersen'}

