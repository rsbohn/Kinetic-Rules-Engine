{"global":[{"source":"http://www.azigo.com/utils/library_proxy.html?","cachable":0,"name":"library_search","datatype":"JSON","type":"datasource"},{"emit":"\nvar a=3;    var b=5;    alert(a+b);        function greet(){    \talert('Hello World');    }    greet();                "}],"dispatch":[{"domain":"www.google.com"},{"domain":"www.azigo.com"},{"domain":"amazon.com"}],"ruleset_name":"a37x8","rules":[{"blocktype":"every","emit":null,"name":"sample","callbacks":null,"state":"active","pagetype":{"foreach":[],"event_expr":{"vars":[],"pattern":"^http://www.google.com","op":"pageview","type":"prim_event","legacy":1}},"cond":{"val":"true","type":"bool"},"actions":[{"action":{"source":null,"args":[{"val":"Hello","type":"str"},{"val":"Welcome","type":"str"}],"name":"notify","modifiers":null}}]},{"blocktype":"every","emit":null,"pre":[{"rhs":" \n<iframe src=\"http://news.yahoo.com\" scrolling=\"auto\" frameborder=\"0\" width=\"100%\" height=\"400px\"/>  \n ","type":"here_doc","lhs":"msg"}],"name":"sample2","callbacks":null,"state":"active","pagetype":{"foreach":[],"event_expr":{"vars":[],"pattern":"^http://www.google.com","op":"pageview","type":"prim_event","legacy":1}},"cond":{"val":"true","type":"bool"},"actions":[{"action":{"source":null,"args":[{"val":"Sample","type":"str"},{"val":"msg","type":"var"}],"name":"notify","modifiers":[{"name":"sticky","value":{"val":"true","type":"bool"}},{"name":"width","value":{"val":"400px","type":"str"}},{"name":"height","value":{"val":"400px","type":"str"}},{"name":"opacity","value":{"val":1,"type":"num"}}]}}]},{"blocktype":"every","emit":"\n$K('#num').change(function() {       KOBJ.eval({\"rids\"  : [\"a37x9\"], \"a37x9:q\":$K('#num').val()});    });          $K('#num').parent().append(\"<br/><br/>Result: <div id='result' style='color: #ff0000; display: inline'><\/div>\");          ","name":"sample3","callbacks":null,"state":"active","pagetype":{"foreach":[],"event_expr":{"vars":[],"pattern":"www.azigo.com","op":"pageview","type":"prim_event","legacy":1}},"cond":{"val":"true","type":"bool"},"actions":[{"action":{"source":null,"args":[],"name":"noop","modifiers":null}}]},{"blocktype":"every","emit":null,"pre":[{"rhs":{"source":"datasource","args":[{"op":"+","args":[{"val":"q=","type":"str"},{"val":"isbn","type":"var"}],"type":"prim"}],"predicate":"library_search","type":"qualified"},"type":"expr","lhs":"book_data"},{"rhs":{"args":[{"val":"$..docs[0].url","type":"str"}],"name":"pick","obj":{"val":"book_data","type":"var"},"type":"operator"},"type":"expr","lhs":"url"},{"rhs":{"args":[{"val":"$..docs[0].title","type":"str"}],"name":"pick","obj":{"val":"book_data","type":"var"},"type":"operator"},"type":"expr","lhs":"title"},{"rhs":" \n<style type=\"text/css\" media=\"screen\">    .mln_round {  \tcursor:pointer;   \tcursor:hand;   \tline-height:20px;  \tbackground: white url(http:\\/\\/www.azigo.com\\/images\\/smgreenbar.jpg) no-repeat right top;   \tpadding-right:16px;   \tvertical-align:middle;  \tdisplay:block;   \tdisplay:inline-block;   \tdisplay:-moz-inline-box;    }    .mln_round span {   \tbackground: white url(http:\\/\\/www.azigo.com\\/images\\/smgreenbar.jpg) no-repeat left top;  \theight:21px;  \tdisplay:block;  \tdisplay:inline-block;  \tpadding-left:16px; line-height:20px;  }  \ta.mln_round {color:#FFF !important; font-size:90%; font-weight:bold; text-decoration:none;}  \ta.mln_round:visited {color:#FFF !important;}  \ta.mln_round:visited span {color:#FFF !important;}  \ta.mln_round:hover {background-position:right -21px;}  \ta.mln_round:hover span {background-position:left -21px;}  \t\t      <\/style>  <div style=\"margin-top: 5px; opacity: 1.0; padding: 10px; -moz-border-radius: 5px; background-color: #FFF; color:#000; text-align: center;\">  <img src=\"http://www.azigo.com/sales-demo/mln_logo.png\">  <p style=\"text-align:center; margin-top: 5px;\">#{title}<\/p>  <p><a href=\"#{url}\" class=\"mln_round\"><span>Check Catalog<\/span><\/a><\/p>  <\/div>  \n ","type":"here_doc","lhs":"msg"},{"rhs":{"val":"<img src='http://www.azigo.com/sales-demo/azigo_black_50.png' style='valign:center;'/>Book Title Found at MLN","type":"str"},"type":"expr","lhs":"msgtitle"}],"name":"sample4_mln","callbacks":null,"state":"active","pagetype":{"foreach":[],"event_expr":{"vars":["path","isbn"],"pattern":"(/gp/product/|/dp/)(\\d+)/","op":"pageview","type":"prim_event","legacy":1}},"cond":{"op":">","args":[{"args":[{"val":"$..numFound","type":"str"}],"name":"pick","obj":{"val":"book_data","type":"var"},"type":"operator"},{"val":0,"type":"num"}],"type":"ineq"},"actions":[{"action":{"source":null,"args":[{"val":"msgtitle","type":"var"},{"val":"msg","type":"var"}],"name":"notify","modifiers":[{"name":"opacity","value":{"val":1,"type":"num"}},{"name":"sticky","value":{"val":"true","type":"bool"}},{"name":"background_color","value":{"val":"#000","type":"str"}}]}}]},{"blocktype":"every","emit":null,"name":"notify_test","callbacks":null,"state":"active","pagetype":{"foreach":[],"event_expr":{"vars":[],"pattern":"^http://www.google.com","op":"pageview","type":"prim_event","legacy":1}},"cond":{"val":"true","type":"bool"},"actions":[{"action":{"source":null,"args":[{"val":"Micronotes Survey Title","type":"str"},{"val":"Micronotes Survey Content","type":"str"}],"name":"notify","modifiers":null}}]},{"blocktype":"every","emit":null,"name":"alert_test","callbacks":null,"state":"active","pagetype":{"foreach":[],"event_expr":{"vars":[],"pattern":"^http://news.yahoo.com","op":"pageview","type":"prim_event","legacy":1}},"cond":{"val":"true","type":"bool"},"actions":[{"action":{"source":null,"args":[{"val":"http://www.cictr.com","type":"str"}],"name":"redirect","modifiers":null}}]},{"blocktype":"every","emit":null,"name":"float_test","callbacks":null,"state":"active","pagetype":{"foreach":[],"event_expr":{"vars":[],"pattern":"http://www.google.com","op":"pageview","type":"prim_event","legacy":1}},"cond":{"val":"true","type":"bool"},"actions":[{"action":{"source":null,"args":[{"val":"absolute","type":"str"},{"val":"top: 10px","type":"str"},{"val":"right: 10px","type":"str"},{"val":"http://www.yahoo.com","type":"str"}],"name":"float","modifiers":[{"name":"delay","value":{"val":0,"type":"num"}},{"name":"draggable","value":{"val":"true","type":"bool"}},{"name":"effect","value":{"val":"appear","type":"str"}}]}}]},{"blocktype":"every","emit":null,"name":"redirect_test","callbacks":null,"state":"active","pagetype":{"foreach":[],"event_expr":{"vars":[],"pattern":"^http://news.yahoo.com","op":"pageview","type":"prim_event","legacy":1}},"cond":{"val":"true","type":"bool"},"actions":[{"action":{"source":null,"args":[{"val":"Hello","type":"str"},{"val":"Welcome","type":"str"}],"name":"notify","modifiers":null}}]},{"blocktype":"every","emit":null,"name":"yahoo_alert","callbacks":null,"state":"active","pagetype":{"foreach":[],"event_expr":{"vars":[],"pattern":"http://www.yahoo.com","op":"pageview","type":"prim_event","legacy":1}},"cond":{"val":"true","type":"bool"},"actions":[{"action":{"source":null,"args":[{"val":"Alert from inside","type":"str"}],"name":"alert","modifiers":null}}]}],"meta":{"description":"\nMicronotes Sample     \n","name":"Micronotes Sample","logging":"off"}}
