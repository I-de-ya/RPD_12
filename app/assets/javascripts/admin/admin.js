$(document).ready(function(){
    $(".btn-slide").click(function(){
          
        timer = function(func, duration){
          return setTimeout(func, duration)
        }

        panel_toggle = function(){
          $("#panel").slideToggle('slow'); 
        }

        expandable_animation = function(value){
          $("#expandable").animate({marginLeft: value},'slow');
        }

        arrow_toggle = function(){
          $(".btn-slide i").toggleClass("icon-circle-arrow-up large-icon");
          $(".btn-slide i").toggleClass("icon-circle-arrow-down large-icon");
          $(".btn-slide i").text($(".btn-slide i").text() == ' свернуть' ? ' развернуть' : ' свернуть');
        }

        if ($(this).hasClass('active'))
          {        
              timer('panel_toggle()', 600);
              expandable_animation('+=20em');
          }
        else
          {
              panel_toggle();
              timer('expandable_animation(\'-=20em\')', 600)
          };

        timer('arrow_toggle()',600);
        $(this).toggleClass("active");
    });
});