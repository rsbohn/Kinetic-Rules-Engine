{"global":[{"emit":"KOBJ.mastercard = {             \"barnesandnoble.com\":[{\"link\":\"http://savings.mastercard.com/secured/default.cfm?ubody=offerDetail&uOfferID=10268&uSource=HT2\",\"text\":\"Get up to 40% off!\"}],             \"priceline.com\":[{\"link\":\"http://savings.mastercard.com/secured/default.cfm?ubody=offerDetail&uOfferID=12405&uSource=HT2\",\"text\":\"Save up to 50%!\"}],             \"nationalcar.com\":[{\"link\":\"http://savings.mastercard.com/secured/default.cfm?ubody=OfferDetail&usource=COL&uOfferID=15656\",\"text\":\"Save up to 25% off and get a free upgrade!\"}],             \"hp.com\":[{\"name\":\"Hewlett-Packard\",\"link\":\"http://savings.mastercard.com/secured/default.cfm?ubody=OfferDetail&usource=COL&uOfferID=7945\",\"text\":\"Save up to 10% off!\"}],             \"sephora.com\":[{\"link\":\"http://savings.mastercard.com/secured/default.cfm?ubody=OfferDetail&usource=COL&uOfferID=23819\",\"text\":\"Save up to 75% off!\"}],             \"shoes.com\":[{\"link\":\"http://savings.mastercard.com/secured/default.cfm?ubody=OfferDetail&usource=COL&uOfferID=18163\",\"text\":\"Get up to $50 off!\"}],             \"ftd.com\":[{\"link\":\"http://savings.mastercard.com/secured/default.cfm?ubody=OfferDetail&usource=COL&uOfferID=11549\",\"text\":\"Get 15% off!\"}],             \"hertz.com\":[{\"link\":\"http://savings.mastercard.com/secured/default.cfm?ubody=OfferDetail&usource=COL&uOfferID=17428\",\"text\":\"Save up to $30!\"}],             \"zales.com\":[{\"link\":\"http://savings.mastercard.com/secured/default.cfm?ubody=OfferDetail&usource=COL&uOfferID=25760\",\"text\":\"Get $50 off your purchase of $300!\"}],             \"dell.com\":[{\"name\":\"Dell\",\"link\":\"http://savings.mastercard.com/secured/default.cfm?ubody=OfferDetail&usource=COL&uOfferID=25964\",\"text\":\"Get 10%, 20%, even 30% off!\"}]        };                           "}],"global_start_line":13,"dispatch":[{"domain":"www.google.com","ruleset_id":null},{"domain":"search.yahoo.com","ruleset_id":null},{"domain":"www.bing.com","ruleset_id":null},{"domain":"search.microsoft.com","ruleset_id":null},{"domain":"shopping.zappos.com","ruleset_id":null}],"dispatch_start_col":5,"meta_start_line":2,"rules":[{"cond":{"val":"true","type":"bool"},"blocktype":"every","actions":[{"action":{"source":null,"name":"annotate_search_results","args":[{"val":"wbur_selector","type":"var"}],"modifiers":[{"value":{"val":"remindme","type":"str"},"name":"name"},{"value":{"args":[{"val":"url_prefix","type":"var"},{"val":"remindme_bar40_l.png","type":"str"}],"type":"prim","op":"+"},"name":"head_image"},{"value":{"args":[{"val":"url_prefix","type":"var"},{"val":"remindme_bar40_r.png","type":"str"}],"type":"prim","op":"+"},"name":"tail_image"},{"value":{"val":"46px","type":"str"},"name":"left_margin"}]},"label":null}],"post":null,"pre":[{"rhs":{"val":"http://frag.kobj.net/clients/1024/images/","type":"str"},"lhs":"url_prefix","type":"expr"},{"rhs":{"val":"http://www.azigo.com/sales-demo/","type":"str"},"lhs":"logo_url_prefix","type":"expr"}],"name":"google","start_col":5,"emit":"var link_text = {    \"mastercard\": \"<img style='padding-top: 3px' src='\" + logo_url_prefix + \"MastercardLogo.jpg' height='34px' border='0'>\"  };      function make_selector(key){  \tvar func = function(obj){  \t  function mk_anchor (o, key) {              return $K('<a href=' + o.link + '/>').attr(  \t      {\"class\": 'KOBJ_'+key,  \t       \"title\": o.text || \"Click here for discounts!\"  \t      }).html(link_text[key]);  \t  }  \t  var entryURL = $K(obj).find(\"span.url, cite\").text();  \t  var host = KOBJ.get_host(entryURL).replace(/^www./, \"\");            var o = KOBJ.pick(KOBJ.mastercard[host]);  \t  if(o) {  \t     return mk_anchor(o,key);  \t  } else {  \t    return false;  \t  }  \t};  \treturn func;  }    wbur_selector = make_selector('mastercard');      search_percolate = {};  search_percolate.domains = {};    function elevate_search_results (annotate) {    var page = 1;      function mk_list_item(i) {      return $K(i).attr({\"class\": \"KOBJ_item\"}).css({\"margin\":\"5px\"});    }       function mk_rm_div (anchor) {      var separator = $K(\"<div>\");      separator.css({\"margin-top\":\"0px\",\"border-top\":\"2px solid black\",\"width\":\"100%\"});        var logo_item = mk_list_item(anchor);        var logo = $K('<img>');      logo.attr({\"src\":\"http://www.azigo.com/sales-demo/MastercardLogo.jpg\",\"align\":\"left\"});      logo.css({\"margin\":\"5px\",\"height\":\"34px\"});        var header=$K(\"<div>\");      header.css({\"height\":\"30px\", \"margin\":\"0px 0px 0px 0px\"});      header.append(logo);        var top_box = $K('<ol>');      top_box.css({\"display\": \"block\",\"padding-top\": \"0px\"});      top_box.attr(\"id\", \"KOBJ_top_box\");      top_box.append(logo_item);        var inner_div = $K('<div>');      inner_div.css({\"margin-top\":\"0px\",\"border-top\":\"2px solid black\",\"width\":\"100%\"});       inner_div.css({});      inner_div.append(top_box);        var rm_div = $K('<div>');      rm_div.attr({\"class\":\"cxx\"});      rm_div.css({\"border\":\"1px solid black\",\"padding-right\": \"0px\",\"min-height\": \"80px\", \"max-width\":\"48em\", \"margin\":\"10px\"});      rm_div.append(header);      rm_div.append($K('<br>'));      rm_div.append(inner_div);        return rm_div;    }        function move_item (obj) {            if($K('#KOBJ_top_box').find(\"li\").is('.KOBJ_item')) {        var separator = $K(\"<div>\");        separator.css({\"margin-top\":\"0px\"});                $K('#KOBJ_top_box').append(mk_list_item(obj));      } else {        if ($K(\"#res\").length)           $K(\"#res\").before(mk_rm_div(obj));        else if ($K(\"#web\").length)           $K(\"#web\").before(mk_rm_div(obj));        else if ($K(\"#results\").length)           $K(\"#results\").before(mk_rm_div(obj));      }    }       var q = String(top.location).replace(/^.*[\\?&][qp]=([^&]+).*$/, \"$1\");      if (q == \"laptop\" || q == \"laptops\"){  \t  move_item(annotate(\"\",1));  \t  move_item(annotate(\"\",2));    }  }      function abq_selector(obj, page){    function mk_anchor (o, key) {      var url_prefix = \"http://www.azigo.com/sales-demo/\";        var lnk = $K('<a href=' + o.link + '/>');      lnk.attr({\"class\": 'KOBJ_'+key,\"title\": o.name});      lnk.text(o.name);            var desc = $K('<span>' + o.text + '</span>');      desc.text(o.text);      desc.css({\"margin\":\"5px\",\"font-weight\":\"bold\"});        var pg = $K('<span>');      pg.text(\"Page #\"+page);      pg.css({\"margin\":\"5px\",\"color\":\"#676767\"});        var line = $K('<div>');      line.append(lnk);      line.append(desc);          line.attr({\"class\": \"KOBJ_item\"});        return $K(\"<li>\").append(line);    }      var host = page==1?\"hp.com\":\"dell.com\";    var o = KOBJ.pick(KOBJ.mastercard[host]);    if(o && !search_percolate.domains[host]) {       search_percolate.domains[host] = 1;       return mk_anchor(o,'abq');    } else {       return false;    }  }    elevate_search_results(abq_selector);              ","state":"active","callbacks":{"success":[{"attribute":"class","trigger":null,"value":"KOBJ_wbur","type":"click"}],"failure":null},"pagetype":{"event_expr":{"pattern":"^http://www.google.com|^http://search.yahoo.com|^http://www.bing.com","legacy":1,"type":"prim_event","vars":[],"op":"pageview"},"foreach":[]},"start_line":17},{"cond":{"val":"true","type":"bool"},"blocktype":"every","actions":[{"action":{"source":null,"name":"notify","args":[{"val":"<img src='http://3.static.getsatisfaction.com/uploaded_images/0275/6462/azigo-a_48px_medium.png' width='34px' height='26px' style='margin-bottom:5px'>","type":"str"},{"val":"invite","type":"var"}],"modifiers":[{"value":{"val":1,"type":"num"},"name":"opacity"},{"value":{"val":"true","type":"bool"},"name":"sticky"}]},"label":null},{"action":{"source":null,"name":"close_notification","args":[{"val":"span.no_thanks","type":"str"}],"modifiers":null},"label":null}],"post":null,"pre":[{"rhs":"<div id=\"kobj_discount\" style=\"padding: 3pt;    -moz-border-radius: 5px;    -webkit-border-radius: 5px;    background-color: #FFFFFF;    width: 225px;    text-align: center;    color: black;\">    <div id=\"screenOne\">    <table border=\"0\">  <tr>   <td><span style=\"color: #72BDCA; font-weight:bold;\"></span></td>   <td><img src=\"https://www.azigo.com/sales-demo/MastercardLogo.jpg\" width=\"70px\"></td>    </tr>  </table>    <table border=\"0\" style=\"margin-top: 20px;\" >  <tr>  <td><span>Use your MasterCard</span></td>   <td>    <span style=\"cursor: pointer;\"><img src=\"https://www.azigo.com/sales-demo/MastercardCardLogo.jpg\" width=\"120px\" onclick=\"fill_card();\"></span>   </td>  </tr>  </table>    <table border=\"0\" style=\"margin-top: 20px;\" >  <tr>    <td><span>Pay with points</span></td>   <td>    <span style=\"cursor: pointer; align:left;\"><img src=\"https://www.azigo.com/sales-demo/MasterCardCart.jpg\" width=\"100px\" onclick=\"show_miles();\"></span>   </td>  </tr >  </table>    <table border=\"0\" style=\"margin-top: 20px;\" >  <tr align=\"center\">   <td colspan=\"2\" align=\"center\">    <span class=\"no_thanks\" style=\"cursor: pointer; align:center; margin-left:17px;\"><img src=\"https://www.azigo.com/sales-demo/NoThanksButton.png\"></span>   </td>  </tr>  </table>    </div>              <div id=\"screenTwo\" style=\"display:none;\">  <table>  <tr style=\"margin-top: 30px;\">   <td><span style=\"color: #72BDCA; font-weight:bold\">Two ways to buy!</span></td>   <td><img src=\"https://www.azigo.com/sales-demo/MastercardLogo.jpg\" width=\"70px\"></td>    </tr>  </table><br/>  <div style=\"align: center; \">  <img src=\"https://www.azigo.com/sales-demo/MasterCardCart.jpg\" width=\"100px\"><br/>  <span style=\"font-weight:bold;margin-top:3px;\">Pay with points!</span><br/>    <div class=\"info\" style=\"margin: 20px;\">      Balance: 150,351<br/>      Needed: 7,200<br/>    </div>  <span style=\"cursor: pointer; margin-left:-5px;\"><img src=\"https://www.azigo.com/sales-demo/UsePointsButton.png\" onclick=\"fill_card('miles');\" width=\"200px\"><br/>  <span style=\"cursor: pointer;\"><img src=\"https://www.azigo.com/sales-demo/GoBackButton.png\" onclick=\"noThanks();\">  </div>  </div>              <div id=\"screenThree\" style=\"display:none;\">  <table>  <tr style=\"margin-top: 30px;\">   <td><span style=\"color: #72BDCA; font-weight:bold\">Don't forget...</span></td>   <td><img src=\"https://www.azigo.com/sales-demo/MastercardLogo.jpg\" width=\"80px\"></td>    </tr>  </table><br/>  <div style=\"align: center; margin-top:20px;\">  <span style=\"font-weight:bold;\">Use your MasyerCard now and earn even more miles!</span><br/>  <div style=\"margin-top: 20px;\">  <img src=\"https://www.azigo.com/sales-demo/MastercardCardLogo.jpg\" width=\"160px\">  </div>  <br/>  <span style=\"font-weight:bold;\">Want to use your SkyMiles AMEX?</span><br/>  <div style=\"margin-top: 30px;\">  <span style=\"cursor: pointer;\"><img src=\"https://www.azigo.com/sales-demo/LetsUseItButton.png\" onclick=\"fill_card('card');\" width=\"200px\"><br/>  <span style=\"cursor: pointer;\"><img src=\"https://www.azigo.com/sales-demo/NoThanksButton.png\" onclick=\"noThanks();\">  </div>  </div>  </div>      <div id=\"wellDone1\" style=\"display:none; margin:15px; font-weight:bold; align: center;\">    Thank you, Jack. You've just saved $72.00 with your Mastercard.<br/><br/><br/>    Your confirmation number is <span style=\"color:red\">GP965J23</span>.<br/><br/><br/>   <span class=\"no_thanks\" style=\"cursor: pointer;\"><img src=\"https://www.azigo.com/sales-demo/CloseButton.png\">  </div>    <div id=\"wellDone2\" style=\"display:none; margin:15px; font-weight:bold; align: center;\">    Thank you, Jack. You've just earned 7,200 Points.<br/><br/><br/>    Your confirmation number is <span style=\"color:red\">GP592J23</span>.<br/><br/><br/>  <span class=\"no_thanks\" style=\"cursor: pointer;\"><img src=\"https://www.azigo.com/sales-demo/CloseButton.png\">  </div>      </p>  </div>     \n ","lhs":"invite","type":"here_doc"}],"name":"zappos","start_col":5,"emit":"fill_card = function(type) {   $K('input[name=ccard_z_number]').attr('value','4121555544444321');   $K('select[name=ccard_z_exp_month]>option[value=02]').attr('selected','selected');   $K('select[name=ccard_z_exp_year]>option[value=2011]').attr('selected','selected');    $K('#screenOne').hide();    $K('#screenTwo').hide();    $K('#screenThree').hide();    if (type=='miles')       $K('#wellDone1').show();    else       $K('#wellDone2').show();  };    show_miles = function(){    $K('#screenOne').hide();    $K('#screenTwo').show();  }  ;show_card = function(){    $K('#screenOne').hide();    $K('#screenThree').show();  }  ;noThanks = function(){    $K('#screenOne').show();    $K('#screenTwo').hide();    $K('#screenThree').hide();  };              ","state":"active","callbacks":null,"pagetype":{"event_expr":{"pattern":"https://shopping.zappos.com/reqauth/checkout.cgi|https://shopping.zappos.com/r/checkout.cgi","legacy":1,"type":"prim_event","vars":[],"op":"pageview"},"foreach":[]},"start_line":38}],"meta_start_col":5,"meta":{"logging":"off","name":"MasterCard Demo2","meta_start_line":2,"meta_start_col":5},"dispatch_start_line":6,"global_start_col":5,"ruleset_name":"a58x15"}