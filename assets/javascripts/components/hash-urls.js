// Generated by CoffeeScript 1.4.0
(function(){var e;e=jQuery;e.hashURLs=function(t){var n,r;r={list:e(".sectionList a"),content:e(".contentSection")};r=e.extend(r,t);window.location.hash?n=window.location.hash:n=r.list.first().attr("href");r.content.not(n).hide();e("[data-hash="+n+"]").addClass("is-active");return r.list.on("click",function(t){var i;i=e(this);t.preventDefault();n=i.attr("href");window.location.hash=n;r.list.removeClass("is-active");r.content.hide();i.addClass("is-active");return e(n).show()})}}).call(this);