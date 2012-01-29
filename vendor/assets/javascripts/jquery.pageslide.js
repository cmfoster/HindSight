(function($){$.fn.pageSlide=function(options){var settings=$.extend({width:"300px",duration:"normal",direction:"left",modal:false,start:function(){},stop:function(){},complete:function(){}},options);var pageslide_slide_wrap_css={position:"fixed",width:"0",top:"0",height:"100%",zIndex:"999"};var pageslide_body_wrap_css={position:"relative",zIndex:"0"};var pageslide_blanket_css={position:"absolute",top:"0px",left:"0px",height:"100%",width:"100%",opacity:"0.0",backgroundColor:"black",zIndex:"1",display:"none"};function _initialize(anchor){if($("#pageslide-body-wrap, #pageslide-content, #pageslide-slide-wrap").size()==0){var psBodyWrap=document.createElement("div");$(psBodyWrap).css(pageslide_body_wrap_css);$(psBodyWrap).attr("id","pageslide-body-wrap").width($("body").width());$("body").contents().wrapAll(psBodyWrap);var psSlideContent=document.createElement("div");$(psSlideContent).attr("id","pageslide-content").width(settings.width);var psSlideWrap=document.createElement("div");$(psSlideWrap).css(pageslide_slide_wrap_css);$(psSlideWrap).attr("id","pageslide-slide-wrap").append(psSlideContent);$("body").append(psSlideWrap)}if($("#pageslide-blanket").size()==0&&settings.modal==true){var psSlideBlanket=document.createElement("div");$(psSlideBlanket).css(pageslide_blanket_css);$(psSlideBlanket).attr("id","pageslide-blanket");$("body").append(psSlideBlanket);$("#pageslide-blanket").click(function(){return false})}$("#pageslide-slide-wrap").click(function(){return false});if(settings.modal!=true){$(document).unbind("click").click(function(elm){_closeSlide(elm);return false})}$(window).resize(function(){$("#pageslide-body-wrap").width($("body").width())})}function _openSlide(elm){_showBlanket();settings.start();if(settings.direction=="right"){direction={right:"-"+settings.width};$("#pageslide-slide-wrap").css({left:0});_overflowFixAdd()}else{direction={left:"-"+settings.width};$("#pageslide-slide-wrap").css({right:0})}$("#pageslide-slide-wrap").animate({width:settings.width},settings.duration);$("#pageslide-body-wrap").animate(direction,settings.duration,function(){settings.stop();$.ajax({type:"GET",url:$(elm).attr("href"),success:function(data){$("#pageslide-content").html(data).queue(function(){$(this).dequeue();$("#pageslide-slide-wrap a").unbind("click").click(function(elm){document.location.href=elm.target.href});$(this).find(".pageslide-close").unbind("click").click(function(elm){_closeSlide(elm);$(this).find("pageslide-close").unbind("click")});settings.complete()})}})})}function _closeSlide(elm){if($(elm)[0].button!=2&&$("#pageslide-slide-wrap").css("width")!="0px"){_hideBlanket();settings.start();direction=($("#pageslide-slide-wrap").css("left")!="0px")?{left:"0"}:{right:"0"};$("#pageslide-body-wrap").animate(direction,settings.duration);$("#pageslide-slide-wrap").animate({width:"0"},settings.duration,function(){$("#pageslide-content").empty();$("#pageslide-body-wrap, #pageslide-slide-wrap").css("left","");$("#pageslide-body-wrap, #pageslide-slide-wrap").css("right","");_overflowFixRemove();settings.stop();settings.complete()})}}function _showBlanket(){if(settings.modal==true){$("#pageslide-blanket").toggle().animate({opacity:"0.8"},"fast","linear")}}function _hideBlanket(){if(settings.modal==true){$("#pageslide-blanket").animate({opacity:"0.0"},"fast","linear",function(){$(this).toggle()})}}function _overflowFixAdd(){($.browser.msie)?$("body, html").css({overflowX:"hidden"}):$("body").css({overflowX:"hidden"})}function _overflowFixRemove(){($.browser.msie)?$("body, html").css({overflowX:""}):$("body").css({overflowX:""})}_initialize(this);return this.each(function(){$(this).unbind("click").bind("click",function(){_openSlide(this);return false})})}})(jQuery);