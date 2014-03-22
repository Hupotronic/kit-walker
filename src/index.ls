require! {
  request: 'hyperquest'
  './strings'
  'optimist'
  'http'
  'fs'
}

# Constants

ID   = optimist.argv._.0
BASE = strings.base ID
REF  = strings.ref ID, BASE
CONF = strings.config ID, BASE

OPTS =
  method: \GET
  agent: false
  headers:
    "Accept": "*/*"
    "Accept-Encoding": "identity"
    "Accept-Language": "en-US,en"
    "Cache-Control": "no-cache"
    "DNT": 1
    "Connection": "keep-alive"
    "Pragma": "no-cache"
    "User-Agent": [
      "Mozilla/5.0 (Windows NT 6.3; WOW64)"
      "AppleWebKit/537.36 (KHTML, like Gecko)"
      "Chrome/31.0.1650.57 Safari/537.36"
    ].join " "

# Helper functions

target = (path) ->
  fs.create-write-stream path

read = (json) ->
  try
    JSON.parse json
  catch e
    console.log "Error reading JSON data: #e"
    console.log json
    return {}

itemize = (data) ->
  [strings.item ID, BASE, k for k of data when k.match /^item/]


# Program flow functions

start = !->
  get-info!

get-info = !->

  opts = {
    hostname: CONF.slice 7 32
    path: CONF.slice 32
    method: \GET
    agent: false
    headers:
      "Accept": "*/*"
      "Accept-Encoding": "identity"
      "Accept-Language": "en-US,en"
      "Cache-Control": "no-cache"
      "DNT": 1
      "Connection": "keep-alive"
      "Pragma": "no-cache"
      "User-Agent": [
        "Mozilla/5.0 (Windows NT 6.3; WOW64)"
        "AppleWebKit/537.36 (KHTML, like Gecko)"
        "Chrome/31.0.1650.57 Safari/537.36"
      ].join " "
      "Host": CONF.slice 7 32
      "Referer": REF
  }

  req = http.request opts, (res, body = '') !->
    res.on \data !-> body += it
    res.on \end  !->
      get-items read body
  req.end!
  req.on \error !->
    console.log "Problem with request: #{it.message}"

get-items = (data) !->

  items = itemize data
  files = []

  download = (name, path, queue) !->

    fpath = (path.match /p-\w+.xhtml/)?0.replace /xhtml$/ 'jpg'
    files.push {name, path: fpath}
    opts = {
      headers:
        "Accept": "*/*"
        "Accept-Encoding": "identity"
        "Accept-Language": "en-US,en"
        "Cache-Control": "no-cache"
        "DNT": 1
        "Connection": "keep-alive"
        "Pragma": "no-cache"
        "User-Agent": [
          "Mozilla/5.0 (Windows NT 6.3; WOW64)"
          "AppleWebKit/537.36 (KHTML, like Gecko)"
          "Chrome/31.0.1650.57 Safari/537.36"
        ].join " "
        "Host": path.slice 7 32
        "Referer": REF
    }

    console.log "Downloading #path to #fpath..."
    <-! request path, opts .pipe target fpath .on \clos

    if queue.length
      next = queue.shift!
      download next.name, next.path, queue
    else
      console.log "All files downloaded."
      format files

  first = items.shift!
  download first.name, first.path, items 

format = (files) !->
  process.exit!

# Start the process
start!