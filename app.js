import express from "express";

const app = express();
app.use(express.json());
app.get("/", (_req, res, _next) => {
  res.send(`
<h1>Hello Crypteia!</h1>
<ul>
  <li>DB_URL: ${process.env.DB_URL}</li>
  <li>MY_KEY: ${process.env.MY_KEY}</li>
</ul>
`);
});

app.listen(8080, () => {});
export default app;
