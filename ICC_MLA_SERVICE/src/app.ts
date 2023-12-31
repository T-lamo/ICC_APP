import express from 'express';

const app = express();
const port = process.env.APP_PORT||8080;

app.get('/', (req, res) => {
  res.send('Hello, TypeScript with Express!');
});

app.get('/mla', (req, res) => {
  res.send('Hello, mla');
});
app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});