let jsonServer = require('json-server')

let server = jsonServer.create()

server.use(jsonServer.defaults())

server.post('/predict', (req, res) => {
  res.jsonp({
    Results: {
      output1: [
        {
          "Scored Label Mean": (Math.random() * 2.0).toString(),
          "Scored Label Standard Deviation": (Math.random() * 5.0).toString()
        }
      ]
    }
  })
})

server.listen(4000, () => {
  console.log('Listening at 4000')
})