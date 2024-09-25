http = require('http')

server = http.createServer((req, res) => {res.end()})


server.listen(3000, 'localhost', () => {console.log('Server is running on port 3000')});

