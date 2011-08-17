# Voidtools::Tracking
# ---------------------------------------------

# Setup:
# 
#   put these lines in your app_helper.rb:
#
#     require 'voidtools/sinatra/tracking'
#     include Voidtools::Tracking


# Usage:
# 
#   :javascript
#     #{crazyegg}
#     #{gauges("id")}


module Voidtools 
module Tracking
  
  def track_run(&block)
    if defined?(Rails)
      yield if Rails.env != "development"
    else
      yield if ENV["RACK_ENV"] != "development"
    end
  end
  
  def analytics(id, *domains) # before the end of head tag
    # FIXME: try with multiple domains
    # TODO: test case
    track_run do
      out = <<-FUN
      var _gaq = _gaq || [];
      _gaq.push(['_setAccount', '#{id}']);FUN
      domains.each do |domain|
        out << "      _gaq.push(['_setDomainName', '.#{domain}']);"
      end
      <<-FUN
      _gaq.push(['_trackPageview']);

      (function() {
        var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
        ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
        var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
      })();
FUN
    end
  end
  
  def mixpanel
    track_run do
      # ...
    end
  end
  
  def crazyegg # before the end of body tag
  
    track_run do   
      <<-FUN 
      setTimeout(function(){var a=document.createElement("script");
      var b=document.getElementsByTagName('script')[0];
      a.src=document.location.protocol+"//dnn506yrbagrg.cloudfront.net/pages/scripts/0011/5433.js";
      a.async=true;a.type="text/javascript";b.parentNode.insertBefore(a,b)}, 1);
FUN
    end

  end
  
  def gauges(id) # before the end of body tag
    track_run do
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
        })();
FUN
    end
  end
end
end