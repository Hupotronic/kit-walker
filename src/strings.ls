
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

  t = KEYWORDS.1            
  p = ESCAPE.2              
  i = PROTOCOL.0            
  d = ESCAPE.1              
  l = LAYOUT.1              
  u = ESCAPE.3              
  b = DISCOVERY.0           
  g = ADAPTER.2             
  h = ESCAPE.4              
  n = NAMES.0               
  f = FORMATS.0             
  q = QUANTITY.1            
  w = b.replace VOWELS, NA  
  s = ESCAPE.0              
  c = TYPE.1                
  o = TLD.0                 
  e = ENV.1                 
  y = DISCOVERY.4           
  z = q.replace VERSION, NA 

  "#i#p#s#s#y#d#c#h#n#d#o#s#e#s#y#s#a#s#q#s#f#u#w#u#l#t#s#g#s#z#s"

# get reference
ref = (a, b) ->

  g = LANGUAGES.0        
  c = DISCOVERY.4        
  o = ESCAPE.1           
  r = LANGUAGES.6        
  h = ESCAPE.0           
  d = b.replace "#c#o" NA
  i = IDS.1              
  e = ESCAPE.6           
  u = QUANTITY.0         
  v = CLIENT.2           
  q = ESCAPE.7           
  n = d.slice 0 24       
  y = u.replace NONE, NA 
  f = LANGUAGES.8        
  s = ESCAPE.5           
  l = LANGUAGES.4        

  "#n#v#h#q#f#e#y#s#r#l#e#g#s#i#e#a"


# get configuration location
config = (a, b) ->

  f = FEED.1              
  c = KEYWORDS.4          
  s = ESCAPE.3            
  t = ESCAPE.1            
  p = DELIVERY.1.slice 0 4

  "#b#c#s#p#t#f"

# get item location
item = (a, b, c) ->

  f = IMAGES.1      
  d = TIME.1        
  m = CLIENT.0      
  q = QUANTITY.0    
  s = ESCAPE.0      
  z = q.slice 1     
  o = ESCAPE.1      
  t = d.slice 0 3   
  i = c.replace t, f

  {
    name: "#c"
    path: "#b#m#s#c#s#z#o#f"
  }

module.exports = {base, ref, config, item}


