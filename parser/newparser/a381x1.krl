{"global":[],"dispatch":[{"domain":"www.google.com"}],"ruleset_name":"a381x1","rules":[{"blocktype":"every","emit":null,"pre":[{"rhs":{"val":"goog","type":"str"},"type":"expr","lhs":"ticker"},{"rhs":{"source":"stocks","args":[{"val":"ticker","type":"var"}],"predicate":"last","type":"qualified"},"type":"expr","lhs":"last"},{"rhs":{"source":"stocks","args":[{"val":"ticker","type":"var"}],"predicate":"open","type":"qualified"},"type":"expr","lhs":"open"},{"rhs":{"source":"stocks","args":[{"val":"ticker","type":"var"}],"predicate":"high","type":"qualified"},"type":"expr","lhs":"high"},{"rhs":{"source":"stocks","args":[{"val":"ticker","type":"var"}],"predicate":"low","type":"qualified"},"type":"expr","lhs":"low"},{"rhs":{"source":"stocks","args":[{"val":"ticker","type":"var"}],"predicate":"volume","type":"qualified"},"type":"expr","lhs":"volume"},{"rhs":{"source":"stocks","args":[{"val":"ticker","type":"var"}],"predicate":"previous_close","type":"qualified"},"type":"expr","lhs":"previous_close"},{"rhs":{"source":"stocks","args":[{"val":"ticker","type":"var"}],"predicate":"name","type":"qualified"},"type":"expr","lhs":"name"},{"rhs":" \nTicker: #{ticker}<br/>          Last: #{last}<br/>          Open: #{open}<br/>          High: #{high}<br/>          Low: #{low}<br/>          Volume: #{volume}<br/>          Previous Close: #{previous_close}<br/>          Name: #{name}<br/>          <style>            .KOBJ_message { font-size: 18px; }            .KOBJ_header { font-size: 24px !important; }          <\/style>            \n ","type":"here_doc","lhs":"msg"}],"name":"newrule","callbacks":null,"state":"active","pagetype":{"foreach":[],"event_expr":{"vars":[],"pattern":".*","op":"pageview","type":"prim_event","legacy":1}},"cond":{"val":"true","type":"bool"},"actions":[{"action":{"source":null,"args":[{"val":"Stock datasource","type":"str"},{"val":"msg","type":"var"}],"name":"notify","modifiers":[{"name":"sticky","value":{"val":"true","type":"bool"}},{"name":"opacity","value":{"val":1,"type":"num"}}]}}]}],"meta":{"author":"Nathan Whiting","description":"\nDOW Ticker Display with Notify     \n","name":"Dow Ticker","logging":"on"}}
