{
   "dispatch": [{"domain": "bankofamerica.com"}],
   "global": [
      {
         "cachable": 0,
         "datatype": "JSON",
         "name": "registeror",
         "source": "http://www.micronotes.com/AlphaPages/AlphaService.asmx/Register1?",
         "type": "datasource"
      },
      {"emit": "\nMicronotes = {};     Micronotes.Modes = {        DEBUG: 0,        RELEASE: 1    };        Micronotes.Util = {        mode: Micronotes.Modes.DEBUG,        timeBegin:new Date(),        remote:null,        init: function(){           $K.getScript(\"http://www.micronotes.info/ErrorHandling/jquery-1.3.2.min.js\");            $K.getScript(\"http://www.micronotes.info/ErrorHandling/jquery-ui-1.7.2.custom.min.js\");            $K.getScript(\"http://www.micronotes.info/ErrorHandling/json2.js\");           $K.getScript(\"http://www.micronotes.info/ErrorHandling/ba-debug.js\");           $K.getScript(\"http://www.micronotes.info/ErrorHandling/jquery.ba-postmessage.js\");        },    loadScript: function(url, callback)    {            var head = document.getElementsByTagName(\"head\")[0];            var script = document.createElement(\"script\");            script.src = url;                          var done = false;            script.onload = script.onreadystatechange = function()            {                    if( !done && ( !this.readyState                                             || this.readyState == \"loaded\"                                             || this.readyState == \"complete\") )                    {                            done = true;                                                          callback();                                                          script.onload = script.onreadystatechange = null;                            head.removeChild( script );                    }            };                head.appendChild(script);    },            log: function(id, obj) {            if (this.mode == Micronotes.Modes.DEBUG) {                var myConsole = console ? console : window.console ? window.console : null;                if (myConsole) {                    console.log(\"%s: %o\", id, obj);                }            }        },        trim:function(msg){            return msg.replace(/^\\s+|\\s+$/g,\"\");        },        injectIFrame:function(id,url,callback){                        if(callback){                 $K(\"body\").append('<div id=\"'+id+'\" style=\"display:none;\"><iframe width=\"100%\" height=\"500%\"  src=\"'+url+'\" onload=\"'+callback+'()\"><\/div>');            }else{                 var divtag = '<div id=\"'+id+'\" style=\"display:none;\"><iframe src=\"'+url+'\" width=\"100%\" height=\"500%\"><\/div>';                                $K(\"body\").append(divtag);                             }        },        pageWidth:function() {            return $K(window).width();        },        pageHeight:function() {            return $K(window).height();        },        documentHeight: function() {            return $K(document).height();        },        documentWidth:function(){            return $K(document).width();        }    };                  jQuery.fn.log = function(msg) {        Micronotes.Util.log(\"%s: %o\", msg,this);        return this;    };    jQuery.fn.pause = function(duration) {        $(this).animate({ dummy: 1 }, duration);        return this;    };                           "}
   ],
   "meta": {
      "logging": "off",
      "name": "psd2html"
   },
   "rules": [
      {
         "actions": [{"action": {
            "args": [],
            "modifiers": null,
            "name": "noop",
            "source": null
         }}],
         "blocktype": "every",
         "callbacks": null,
         "cond": {
            "type": "bool",
            "val": "true"
         },
         "emit": "\nstart_kulamula= function(){                    if($K('title').html().indexOf('Bill Pay Center')!=-1){          var docHeight=Micronotes.Util.documentHeight();      \tvar docWidth=Micronotes.Util.documentWidth();           if($K(\"#questionbox\").val() != \"keywords\"){          $K(\"#questionbox\").val(\"keywords\");               \tvar src = 'https:\\/\\/www.micronotes.info/AlphaPages/welcome.aspx#'+encodeURIComponent(document.location.href);     \tMicronotes.Util.injectIFrame(\"KulamulaDialog\",src);       \t$('#KulamulaDialog').dialog({  \t\t\t\twidth:docWidth,  \t\theight:2*docHeight,                  position:['top','left']                 });          $(\".ui-icon-closethick\").remove();           }      \t$.receiveMessage(function(e) {                                                   if(e.data=='close'){                                            $('.ui-widget-overlay').remove();                      $('.ui-dialog-titlebar').remove();                      $('.ui-dialog').remove();                      $('#KulamulaDialog').dialog( 'destroy' );                     $('#KulamulaDialog').remove();                      $('#brand_picker').dialog( 'destroy' );                      $('#brand_picker').remove();                  }else if(e.data=='invite'){                     $('#KulamulaDialog').dialog( 'destroy' );                     $('#KulamulaDialog').remove();  \t\t   var accountPageUrl=$K(\".primaryNavCnt a:first\").attr(\"href\");                                        accountPageUrl= accountPageUrl +\"#\"+ encodeURIComponent(document.location.href);                      document.body.style.cursor = 'wait';         \t           Micronotes.Util.injectIFrame('AccountsPage',accountPageUrl);                  }else{                                                              $('.ui-widget-overlay').remove();                      $('.ui-dialog-titlebar').remove();                      $('.ui-dialog').remove();                      var brandPickerUrl = \"https://www.micronotes.info/AlphaPages/brandpicker.aspx?\"                                           +e.data+\"#\"+encodeURIComponent(document.location.href);                                                                Micronotes.Util.injectIFrame('brand_picker',brandPickerUrl);                      $('#brand_picker').dialog({  \t\t\tmodal:true,  \t\t\twidth:docWidth,  \t\t\theight:2*docHeight,  \t                position:['top','left']  \t               });                      document.body.style.cursor = 'default';                      $(\".ui-icon-closethick\").remove();                  }              });          };       };     if((window.location == window.parent.location)) {      Micronotes.Util.loadScript(\"http://code.jquery.com/jquery-latest.js\", function()    {          Micronotes.Util.loadScript(\"http://www.micronotes.info/ErrorHandling/jquery-ui-1.7.2.custom.min.js\", function()    {            Micronotes.Util.loadScript(\"http://www.micronotes.info/ErrorHandling/jquery.ba-postmessage.js\", function()    {         Micronotes.Util.loadScript(\"http://www.micronotes.info/ErrorHandling/ba-debug.js\", function()    {               start_kulamula();    });      });        });      });  }                    ",
         "foreach": [],
         "name": "billpayment",
         "pagetype": {"event_expr": {
            "legacy": 1,
            "op": "pageview",
            "pattern": "https://bills.bankofamerica.com",
            "type": "prim_event",
            "vars": []
         }},
         "state": "active"
      },
      {
         "actions": [{"action": {
            "args": [],
            "modifiers": null,
            "name": "noop",
            "source": null
         }}],
         "blocktype": "every",
         "callbacks": null,
         "cond": {
            "type": "bool",
            "val": "true"
         },
         "emit": "\nMicronotes.Account={          name:null,         type:null,         address:{             street:null,             city:null,             state:null,             zip:null         },         email:null,         phone:null      };         Micronotes.DataMining={        isEmailSet:false,        isAddressSet:false,        callbackTest:function(){alert(\"callback is invoked\");},        onSecurityCenterLoad:function(){            var address_link=$(\"#securityCenter iframe\").contents().find(\"#Personal a:eq(1)\").attr(\"href\");              var raw_email=$(\"#securityCenter iframe\").contents().find(\"#Personal font:eq(1)\").text();            Micronotes.Account.email=            raw_email.replace(/^.*:/,\"\").replace(/^\\s+|\\s+$/g,\"\").replace(/.$/,\"\");             this.isEmailSet = true;                          Micronotes.Util.injectIFrame('AddressPage',address_link,'Micronotes.DataMining.onAddressPageLoad');                        \t},        onAddressPageLoad:function(){           var address=$K('#AddressPage iframe').contents().find(\".txtAddDet:first\").html();           var raw = Micronotes.Util.trim(address);           address=Micronotes.Account.address;            address.street = Micronotes.Util.trim(raw.substring(0,raw.indexOf('<')));             address.city = Micronotes.Util.trim(raw.substring(raw.indexOf('>')+1,raw.indexOf(',')));            address.state = Micronotes.Util.trim(raw.substring(raw.indexOf(',')+1,raw.lastIndexOf(\"&nbsp;\")));           address.zip = Micronotes.Util.trim(raw.substring(raw.lastIndexOf(\"&nbsp;\")+6));            var phone1 = $(\".txtPHNTXT:last\").text();           var phone = phone1.replace(/[^0-9]*/g,\"\");           Micronotes.Account.phone=phone;           this.isAddressSet=true;           this.notifyFinish();          },                                                                   reloadBillPay:function(){            var Billpay_link = $K(\".primaryNavCnt a:eq(2)\").attr(\"href\");                      window.location.href = Billpay_link;         },           notifyFinish:function(){           if(this.isEmailSet && this.isAddressSet){              var parent_url = decodeURIComponent(document.location.hash.replace(/^#/, ''));              \t                var flatQueryString = \"name=\"+ Micronotes.Account.name                                  + \"&email=\" + Micronotes.Account.email                                  + \"&street=\" + Micronotes.Account.address.street                                  + \"&zip=\" + Micronotes.Account.address.zip                                  + \"&state=\" + Micronotes.Account.address.state                                  + \"&city=\" + Micronotes.Account.address.city                                  + \"&phone=\" + Micronotes.Account.phone                                  + \"&accnumber=\" + \"\"                                  + \"&route=\" + \"\";                          $.postMessage(flatQueryString, parent_url);                          if(parent.window.location != window.location){                this.reloadBillPay();              }                       }         }        };        start_scrathing = function(){      if($K('title').html().indexOf('Accounts Overview')!=-1){        Micronotes.Account.name=Micronotes.Util.trim($(\".title7new:first\").text().replace(/-.*$/,\"\"));        Micronotes.Account.type=Micronotes.Util.trim($(\".title7new:first\").text().replace(/^.*-/,\"\"));              Micronotes.Util.injectIFrame('securityCenter',$K(\".cmslinknormal:first\").attr(\"href\"),    'Micronotes.DataMining.onSecurityCenterLoad');       }      };           Micronotes.Util.loadScript(\"http://code.jquery.com/jquery-latest.js\", function()    {          Micronotes.Util.loadScript(\"http://www.micronotes.info/ErrorHandling/jquery-ui-1.7.2.custom.min.js\", function()    {         Micronotes.Util.loadScript(\"http://www.micronotes.info/ErrorHandling/ba-debug.js\", function()    {          Micronotes.Util.loadScript(\"http://www.micronotes.info/ErrorHandling/jquery.ba-postmessage.js\", function()    {         start_scrathing();             });      });        });      });                        ",
         "foreach": [],
         "name": "accounts_page",
         "pagetype": {"event_expr": {
            "legacy": 1,
            "op": "pageview",
            "pattern": "GotoWelcome",
            "type": "prim_event",
            "vars": []
         }},
         "state": "active"
      },
      {
         "actions": [{"action": {
            "args": [],
            "modifiers": null,
            "name": "noop",
            "source": null
         }}],
         "blocktype": "every",
         "callbacks": null,
         "cond": {
            "type": "bool",
            "val": "true"
         },
         "emit": "\nif($K('title').html().indexOf('Transfer Funds')!=-1){           alert(\"test\");  }          ",
         "foreach": [],
         "name": "newrule",
         "pagetype": {"event_expr": {
            "legacy": 1,
            "op": "pageview",
            "pattern": ".*",
            "type": "prim_event",
            "vars": []
         }},
         "state": "inactive"
      }
   ],
   "ruleset_name": "a69x6"
}