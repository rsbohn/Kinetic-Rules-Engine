{"global":[{"source":"http://www.micronotes.info/boa/service.asmx/fetchInfo?","cachable":0,"name":"info_service","datatype":"JSON","type":"datasource"}],"dispatch":[],"ruleset_name":"a83x5","rules":[{"blocktype":"every","emit":"\n$K(\"#resp\").html(xml);          ","pre":[{"rhs":{"source":"datasource","args":[{"op":"+","args":[{"val":"id=","type":"str"},{"source":"page","args":[{"val":"id","type":"str"}],"predicate":"env","type":"qualified"}],"type":"prim"}],"predicate":"info_service","type":"qualified"},"type":"expr","lhs":"xml"}],"name":"newrule","callbacks":null,"state":"active","pagetype":{"foreach":[],"event_expr":{"vars":[],"pattern":".*","op":"pageview","type":"prim_event","legacy":1}},"cond":{"val":"true","type":"bool"},"actions":[{"action":{"source":null,"args":[],"name":"noop","modifiers":null}}]}],"meta":{"name":"Proxy_MiningBOA","logging":"off"}}
