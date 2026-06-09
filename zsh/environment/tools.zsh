#
# Tool-specific environment variables
#

# aws-vault: store key in the login keychain instead of a hidden keychain,
# and stretch session times so passwords aren't re-entered every 5min
export AWS_VAULT_KEYCHAIN_NAME=login
export AWS_SESSION_TTL=24h
export AWS_ASSUME_ROLE_TTL=1h

# Claude Octopus project tier
export OCTO_TIER=production
