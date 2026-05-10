const {
  SecretsManagerClient,
  GetSecretValueCommand,
} = require("@aws-sdk/client-secrets-manager");

const client = new SecretsManagerClient({
  region: "ap-southeast-2",
});

async function getSecrets() {
  const command = new GetSecretValueCommand({
    SecretId: "prod/db/credentials",
  });

  const response = await client.send(command);

  return JSON.parse(response.SecretString);
}

module.exports = getSecrets;