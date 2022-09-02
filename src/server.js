const app = require("./app");
const port = 3000;
app.listen(port, () =>
    console.log(`Sever is now listening http://localhost:${port}/`)
);
