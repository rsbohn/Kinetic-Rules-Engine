{"global":[{"source":"http://search.twitter.com/search.json?show_user=true&rpp=3","name":"twitter_search","type":"datasource","datatype":"JSON","cachable":0}],"global_start_line":12,"dispatch":[{"domain":"www.google.com","ruleset_id":null}],"dispatch_start_col":5,"meta_start_line":2,"rules":[{"cond":{"val":"true","type":"bool"},"blocktype":"every","actions":[{"action":{"source":null,"name":"notify","args":[{"val":"Hello World","type":"str"},{"val":"A Note to say hello","type":"str"}],"modifiers":[{"value":{"val":"true","type":"bool"},"name":"sticky"}],"vars":null},"label":null}],"post":null,"pre":null,"name":"hello","start_col":5,"emit":null,"state":"active","callbacks":null,"pagetype":{"event_expr":{"pattern":".*","legacy":1,"type":"prim_event","vars":[],"op":"pageview"},"foreach":[]},"start_line":15},{"cond":{"val":"true","type":"bool"},"blocktype":"every","actions":[{"action":{"source":null,"name":"before","args":[{"val":"#res","type":"str"},{"val":"twit_res","type":"var"}],"modifiers":null,"vars":null},"label":null}],"post":null,"pre":[{"rhs":{"source":"datasource","predicate":"twitter_search","args":[{"val":[{"rhs":{"val":"query","type":"var"},"lhs":"q"}],"type":"hashraw"}],"type":"qualified"},"lhs":"tweets","type":"expr"},{"rhs":{"obj":{"val":"tweets","type":"var"},"args":[{"val":"$..results[0].text","type":"str"}],"name":"pick","type":"operator"},"lhs":"res","type":"expr"},{"rhs":"<div style=\"background-color: #FF9\">  From Twitter:<br/>  #{res}  </div>    \n ","lhs":"twit_res","type":"here_doc"}],"name":"googtweets","start_col":5,"emit":null,"state":"active","callbacks":null,"pagetype":{"event_expr":{"pattern":"/search?.*&q=([^&]*)","legacy":1,"type":"prim_event","vars":["query"],"op":"pageview"},"foreach":[]},"start_line":22}],"meta_start_col":5,"meta":{"logging":"on","name":"didw_demo","meta_start_line":2,"description":"A demo for DIDW     \n","meta_start_col":5},"dispatch_start_line":9,"global_start_col":5,"ruleset_name":"a16x32"}