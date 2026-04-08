const express = require('express');
const app = express();
const PORT = process.env.PORT || 3000;

app.get('/', (req, res) => {
  res.json({
    status: 'live',
    message: 'Deployed via Docker + GitHub Actions',
    version: process.env.APP_VERSION || '1.0.0'
  });
});

app.listen(PORT, () => console.log(`Running on port ${PORT}`));
