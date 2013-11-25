/*******************************************************************

			acceptance-criteria-dropdown.js

********************************************************************/
    "use strict"

    var acddStr = '<button class="dropdown-checkbox-toggle btn btn-primary icon-plus-sign bringtofront"><span></span></button> ';
    acddStr += '<div class="acceptance-criteria"><ul>';
    acddStr += '<li><p class="title">Functional Skills Signposting</p></li>';
    acddStr += '<li data-category="english"><p class="cat-title">English</p></li>';
    acddStr += '<li data-category="english"><label><input type="checkbox" /> Speaking, listening and communication</label></li>';
    acddStr += '<li data-category="english"><label><input type="checkbox" /> Reading</label></li>';
    acddStr += '<li data-category="english"><label><input type="checkbox" /> Writing</label></li>';
    acddStr += '<li data-category="mathematics"><p class="cat-title">Mathematics</p></li>';
    acddStr += '<li data-category="mathematics"><label><input type="checkbox" /> Representing.</label></li>';
    acddStr += '<li data-category="mathematics"><label><input type="checkbox" /> Analysing.</label></li>';
    acddStr += '<li data-category="mathematics"><label><input type="checkbox" /> Interpreting.</label></li>';
    acddStr += '<li data-category="ict"><p class="cat-title">ICT</p></li>';
    acddStr += '<li data-category="ict"><label><input type="checkbox"/> Using ICT</label></li>';
    acddStr += '<li data-category="ict"><label><input type="checkbox"/> Finding and selecting information</label></li>';
    acddStr += '<li data-category="ict"><label><input type="checkbox"/> Developing, presenting and communicating information Using ICT</label></li>';
    acddStr += '</ul></div>';
    console.log(acddStr) ;

    $(document).ready(function(){

         if($('.acceptance-criteria-dropdown').length > 0){
             $('.acceptance-criteria-dropdown').append(acddStr) ;
         }

         $('body').on("click", "button.dropdown-checkbox-toggle", function(){

            var $this = $(this),
                $dropdown = $this.siblings(".acceptance-criteria");

                $dropdown.toggle();
         })
    });
