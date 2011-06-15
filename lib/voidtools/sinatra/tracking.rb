module Voidtools 
module Sinatra
module Tracking
  def analytics(id, domain) # before the end of head tag
   <<-FUN
   var _gaq = _gaq || [];
   _gaq.push(['_setAccount', '#{id}']);
   //_gaq.push(['_setDomainName', '.#{domain}']);
   _gaq.push(['_trackPageview']);

   (function() {
     var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
     ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
     var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
   })();
FUN
 
  end
  
  def mixpanel
    # ...
  end
  
  def crazyegg # before the end of body tag
    <<-FUN 
    setTimeout(function(){var a=document.createElement("script");
    var b=document.getElementsByTagName('script')[0];
    a.src=document.location.protocol+"//dnn506yrbagrg.cloudfront.net/pages/scripts/0011/5433.js";
    a.async=true;a.type="text/javascript";b.parentNode.insertBefore(a,b)}, 1);
FUN

  end
  
  def gauges(id) # before the end of body tag
    <<-FUN 
    (function() {
        var t   = document.createElement('script');
        t.type  = 'text/javascript';
        t.async = true;
        t.id    = 'gauges-tracker';
        t.setAttribute('data-site-id', '#{id}');
        t.src = '//secure.gaug.es/track.js';
        var s = document.getElementsByTagName('script')[0];
        s.parentNode.insertBefore(t, s);
      })();"
FUN
  end
end
end
end