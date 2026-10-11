const express = require('express');
const mysql = require('mysql2/promise');

const app = express();
const port = Number(process.env.PORT || 3000);
app.use(express.json());

app.get('/health', (_req, res) => res.json({ status: 'ok' }));
app.get('/api/info', (_req, res) => res.json({ service: 'aws-3tier-backend', databaseConfigured: Boolean(process.env.DB_HOST) }));

app.get('/api/db-health', async (_req, res) => {
  if (!process.env.DB_HOST || !process.env.DB_USER || !process.env.DB_PASSWORD || !process.env.DB_NAME) {
    return res.status(503).json({ status: 'unconfigured', message: 'Database connection environment variables are required' });
  }
  let connection;
  try {
    connection = await mysql.createConnection({
      host: process.env.DB_HOST,
      port: Number(process.env.DB_PORT || 3306),
      user: process.env.DB_USER,
      password: process.env.DB_PASSWORD,
      database: process.env.DB_NAME,
      connectTimeout: 3000
    });
    await connection.query('SELECT 1');
    return res.json({ status: 'ok', database: 'reachable' });
  } catch (_error) {
    return res.status(503).json({ status: 'unavailable', database: 'unreachable' });
  } finally {
    if (connection) await connection.end();
  }
});

if (require.main === module) app.listen(port, '0.0.0.0', () => console.log('API listening on port ' + port));
module.exports = app;
