const {
  SecretsManagerClient,
  GetSecretValueCommand,
} = require("@aws-sdk/client-secrets-manager");

const client = new SecretsManagerClient({
  region: "rds!db-b3177dda-59b0-4d5d-ac22-57073d9bcdd4",
});

async function getSecrets() {
  const command = new GetSecretValueCommand({
    SecretId: "prod/db/credentials",
  });

  const response = await client.send(command);

  return JSON.parse(response.SecretString);
}

module.exports = getSecrets;