const express = require('express')

var app = express()
app.listen(8080)
console.log('Listen at port 8080.')

process.on('SIGINT', function() {
  console.log('')
  console.log('Bye bye.')
  process.exit()
})

app.use(function(req, res, next) {
  const cmd = process.argv.join(' ')
  const request = `${req.method} ${req.url}`
  const headers = JSON.stringify(req.rawHeaders)
  let data = ''

  req.on('data', function(chunk){ data += chunk})
  req.on('end', function(){
    const echo = `${cmd}\n ${request}\n ${headers}\n ${data}\n`
    console.log(echo)
    res.send(echo)
    next()
  })
})
