{"global":[{"emit":"\nKOBJ.delta = {\"www.1800flowers.com\" :                   [{\"link\":                     \"http://skymilesoffers.delta.com/shopping_other.php\",    \t\t \"text\":    \t\t \"Get discounts on flowers!\"                    }                   ]    \t\t};                           "}],"dispatch":[],"ruleset_name":"a58x1","rules":[{"blocktype":"every","emit":"\n        ","pre":[{"rhs":" \n<div id=\"kobj_discount\" style=\"padding: 4pt;    -moz-border-radius: 5px;    -webkit-border-radius: 5px;    background-color: #FFFFFF;    width: 225px;    text-align: center;    color: black;\">    <div id=\"screenOne\">    <table border=\"0\" style=\"margin-left:50px; margin-right:50px\";>  <tr>   <td><img src=\"http://media.wkrg.com/images/sized/media/news4/BBB_logo-300x461.jpg\" width=\"120px\" height=\"200px\"><\/td>    <\/tr>  <\/table>  <center>  <table border=\"0\" style=\"margin-top: 20px; align:center;\" >  <tr>  <td>This is a known <b>scam site!<\/b><\/td>  <\/tr>  <tr>  <td  style=\"align:center;\"><span style=\"align:center;\">BBB Rating: F<\/span><\/td>  <\/tr>  <\/table>  <\/center>  <\/div>  <\/p>  <\/div>     \n ","type":"here_doc","lhs":"invite"}],"name":"bbb_warning","callbacks":null,"state":"active","pagetype":{"foreach":[],"event_expr":{"vars":[],"pattern":"https://rh157.azigo.net:8443/verizon/phish.jsp","op":"pageview","type":"prim_event","legacy":1}},"cond":{"val":"true","type":"bool"},"actions":[{"action":{"source":null,"args":[{"val":"BBB Warning","type":"str"},{"val":"invite","type":"var"}],"name":"notify","modifiers":[{"name":"opacity","value":{"val":1,"type":"num"}},{"name":"sticky","value":{"val":"true","type":"bool"}}]}},{"action":{"source":null,"args":[{"val":"span.no_thanks","type":"str"}],"name":"close_notification","modifiers":null}}]}],"meta":{"description":"\nBBB Rules   \n","name":"BBB","logging":"off"}}
