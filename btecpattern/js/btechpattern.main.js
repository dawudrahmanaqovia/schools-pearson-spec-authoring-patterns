/*******************************************************************

			acceptance-criteria-dropdown.js

********************************************************************/
    "use strict"

    var acddStr = '<div class="signposting-dropdown acceptance-criteria"><ul>';
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
    
    var pltsddStr = '<div class="signposting-dropdown acceptance-criteria"><ul>';
    pltsddStr += '<li><p class="title">Personal Learning and Thinking Skils (PLTS) Signposting</p></li>';
    pltsddStr += '<li data-category="plst"><label><input type="checkbox" /> Independent Enquirers</label></li>';
    pltsddStr += '<li data-category="plst"><label><input type="checkbox" /> Creative Thinkers</label></li>';
    pltsddStr += '<li data-category="plst"><label><input type="checkbox" /> Reflective Learners</label></li>';
    pltsddStr += '<li data-category="plst"><label><input type="checkbox" /> Team Workers</label></li>';
    pltsddStr += '<li data-category="plst"><label><input type="checkbox" /> Self Managers</label></li>';
    pltsddStr += '<li data-category="plst"><label><input type="checkbox" /> Effective Participants</label></li>';
    pltsddStr += '</ul></div>';
    
    var scddStr = '<div class="signposting-dropdown acceptance-criteria"><ul>';
    scddStr += '<li><p class="title">GCSE Subject Criteria Signposting</p></li>';
    scddStr += '<li data-category="ict"><label><input type="checkbox"/> English</label></li>';
    scddStr += '<li data-category="ict"><label><input type="checkbox"/> Mathmatics</label></li>';
    scddStr += '</ul></div>';
    //console.log(acddStr) ;

    $(document).ready(function(){

         if($('.acceptance-criteria-dropdown').length > 0){
             $('.acceptance-criteria-dropdown').append(acddStr) ;
         }

         $('body').on("click", ".dropdown-checkbox-toggle", function(e){

            var $this = $(this),
                $dropdown = $this.siblings(".signposting-dropdown");
                $(".signposting-dropdown").hide(250);

                $dropdown.toggle(250);
         })
    });
