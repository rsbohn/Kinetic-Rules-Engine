{"global":[],"global_start_line":null,"dispatch":[{"domain":"google.com","ruleset_id":null},{"domain":"kynetx.com","ruleset_id":null},{"domain":"fogbugz.com","ruleset_id":null},{"domain":"twitter.com","ruleset_id":null}],"dispatch_start_col":5,"meta_start_line":2,"rules":[{"cond":{"val":"true","type":"bool"},"blocktype":"every","actions":[{"action":{"source":null,"name":"notify","args":[{"val":"1.0","type":"str"},{"val":"first action of first rule","type":"str"}],"modifiers":null},"label":null},{"action":{"source":null,"name":"notify","args":[{"val":"1.1","type":"str"},{"val":"second action of first rule","type":"str"}],"modifiers":null},"label":null},{"action":{"source":null,"name":"alert","args":[{"val":"1.2 third action of first rule","type":"str"}],"modifiers":null},"label":null}],"post":null,"pre":null,"name":"first","start_col":5,"emit":null,"state":"active","callbacks":null,"pagetype":{"event_expr":{"pattern":".*","legacy":1,"type":"prim_event","vars":[],"op":"pageview"},"foreach":[]},"start_line":16},{"cond":{"val":"true","type":"bool"},"blocktype":"every","actions":[{"action":{"source":null,"name":"notify","args":[{"val":"2.0","type":"str"},{"val":"first action of second rule","type":"str"}],"modifiers":null},"label":null},{"action":{"source":null,"name":"notify","args":[{"val":"2.1","type":"str"},{"val":"second action of second rule","type":"str"}],"modifiers":null},"label":null},{"action":{"source":null,"name":"alert","args":[{"val":"2.2 third action of second rule","type":"str"}],"modifiers":null},"label":null}],"post":null,"pre":null,"name":"second","start_col":5,"emit":null,"state":"active","callbacks":null,"pagetype":{"event_expr":{"pattern":".*","legacy":1,"type":"prim_event","vars":[],"op":"pageview"},"foreach":[]},"start_line":25},{"cond":{"val":"true","type":"bool"},"blocktype":"every","actions":[{"action":{"source":null,"name":"notify","args":[{"val":"3.0","type":"str"},{"val":"first action of third rule","type":"str"}],"modifiers":null},"label":null},{"action":{"source":null,"name":"notify","args":[{"val":"3.1","type":"str"},{"val":"second action of third rule","type":"str"}],"modifiers":null},"label":null},{"action":{"source":null,"name":"alert","args":[{"val":"3.2 third action of third rule","type":"str"}],"modifiers":null},"label":null}],"post":null,"pre":null,"name":"third","start_col":5,"emit":null,"state":"active","callbacks":null,"pagetype":{"event_expr":{"pattern":".*","legacy":1,"type":"prim_event","vars":[],"op":"pageview"},"foreach":[]},"start_line":34}],"meta_start_col":5,"meta":{"logging":"on","name":"order test","meta_start_line":2,"author":"MikeGrace","description":"testing true execution order of rules     \n","meta_start_col":5},"dispatch_start_line":10,"global_start_col":null,"ruleset_name":"a60x70"}