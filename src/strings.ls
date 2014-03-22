
# Constants

VERSION    = '1'
NAMES      = <[ walker ]>
TYPE       = <[ book comic ]>
DISCOVERY  = <[ browse search referrer gift delivery ]>
DELIVERY   = <[ digital packet ]>
FORMATS    = <[ epub pdf ]>
LAYOUT     = <[ responsive fixed fluid ]>
CLIENT     = <[ mobile desktop viewer ]>
LANGUAGES  = <[ en ja kr zh cl ru dl se tw no ]>
PROTOCOL   = <[ http https ftp ]>
ADAPTER    = <[ DVI HDMI VGA DP ]>
ESCAPE     = <[ / . : _ - & = ? ]>
ENV        = <[ development production ]>
IMAGES     = <[ png jpeg gif ]>
IDS        = <[ sid cid gid tid ]>
TLD        = <[ com net org io ]>
FEED       = <[ atom json ]>
QUANTITY   = <[ 10 100 1000 10000 ]>
KEYWORDS   = <[ design layout web responsive configuration ]>
TIME       = <[ time date hour minute second ]>
VOWELS     = /[aeiou]/g
NONE       = '0'
NA         = ''

# get base designation
base = (a) ->

  t = KEYWORDS.1              # layout
  p = ESCAPE.2                # :
  i = PROTOCOL.0              # http
  d = ESCAPE.1                # .
  l = LAYOUT.1                # fixed
  u = ESCAPE.3                # _
  b = DISCOVERY.0             # browse
  g = ADAPTER.2               # VGA
  h = ESCAPE.4                # -
  n = NAMES.0                 # walker
  f = FORMATS.0               # epub
  q = QUANTITY.1              # 100
  w = b.replace VOWELS, NA    # browse
  s = ESCAPE.0                # /
  c = TYPE.1                  # comic
  o = TLD.0                   # com
  e = ENV.1                   # production
  y = DISCOVERY.4             # delivery
  z = q.replace VERSION, NA   # 00

  "#i#p#s#s#y#d#c#h#n#d#o#s#e#s#y#s#a#s#q#s#f#u#w#u#l#t#s#g#s#z#s"

# get reference
ref = (a, b) ->

  g = LANGUAGES.0          # en
  c = DISCOVERY.4          # delivery
  o = ESCAPE.1             # .
  r = LANGUAGES.6          # dl
  h = ESCAPE.0             # /
  d = b.replace "#c#o" NA  # 0 24
  i = IDS.1                # cid
  e = ESCAPE.6             # =
  u = QUANTITY.0           # 10
  v = CLIENT.2             # viewer
  q = ESCAPE.7             # ?
  n = d.slice 0 24         # base
  y = u.replace NONE, NA   # 1
  f = LANGUAGES.8          # tw
  s = ESCAPE.5             # &
  l = LANGUAGES.4          # cl

  "#n#v#h#q#f#e#y#s#r#l#e#g#s#i#e#a"


# get configuration location
config = (a, b) ->

  f = FEED.1               # json
  c = KEYWORDS.4           # configuration
  s = ESCAPE.3             # _
  t = ESCAPE.1             # .
  p = DELIVERY.1.slice 0 4 # pack

  "#b#c#s#p#t#f"

# get item location
item = (a, b, c) ->

  f = IMAGES.1       # jpeg
  d = TIME.1         # date
  m = CLIENT.0       # mobile
  q = QUANTITY.0     # 10
  s = ESCAPE.0       # /
  z = q.slice 1      # 0
  o = ESCAPE.1       # .
  t = d.slice 0 3    # date
  i = c.replace t, f # path

  {
    name: "#c"
    path: "#b#m#s#c#s#z#o#f"
  }

module.exports = {base, ref, config, item}


