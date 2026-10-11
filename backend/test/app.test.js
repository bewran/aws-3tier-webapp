const test = require('node:test');
const assert = require('node:assert/strict');
const app = require('../app');

test('health endpoint reports OK', async () => {
  const server = app.listen(0);
  try {
    const address = server.address();
    const response = await fetch('http://127.0.0.1:' + address.port + '/health');
    assert.equal(response.status, 200);
    assert.deepEqual(await response.json(), { status: 'ok' });
  } finally { await new Promise(resolve => server.close(resolve)); }
});

test('database health is unavailable when unconfigured', async () => {
  const server = app.listen(0);
  try {
    const address = server.address();
    const response = await fetch('http://127.0.0.1:' + address.port + '/api/db-health');
    assert.equal(response.status, 503);
  } finally { await new Promise(resolve => server.close(resolve)); }
});
