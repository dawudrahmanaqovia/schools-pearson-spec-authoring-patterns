/*******************************************************************

			btechpattern.main.js

********************************************************************/
    "use strict"

    var acddStr = '<div class="signposting-dropdown acceptance-criteria"><ul>';
    acddStr += '<li><p class="title">Functional Skills Signposting</p></li>';
    acddStr += '<li data-category="english"><p class="cat-title">English</p></li>';
    acddStr += '<li data-category="english"><label><input type="checkbox" /> <span>Speaking, listening and communication</span></label></li>';
    acddStr += '<li data-category="english"><label><input type="checkbox" /> <span>Reading</span></label></li>';
    acddStr += '<li data-category="english"><label><input type="checkbox" /> <span>Writing</span></label></li>';
    acddStr += '<li data-category="mathematics"><p class="cat-title">Mathematics</p></li>';
    acddStr += '<li data-category="mathematics"><label><input type="checkbox" /> <span>Representing</span></label></li>';
    acddStr += '<li data-category="mathematics"><label><input type="checkbox" /> <span>Analysing</span></label></li>';
    acddStr += '<li data-category="mathematics"><label><input type="checkbox" /> <span>Interpreting</span></label></li>';
    acddStr += '<li data-category="ict"><p class="cat-title">ICT</p></li>';
    acddStr += '<li data-category="ict"><label><input type="checkbox"/> <span>Using ICT</span></label></li>';
    acddStr += '<li data-category="ict"><label><input type="checkbox"/> <span>Finding and selecting information</span></label></li>';
    acddStr += '<li data-category="ict"><label><input type="checkbox"/> <span>Developing, presenting and communicating information Using ICT</span></label></li>';
    acddStr += '</ul></div>';
    
    var pltsddStr = '<div class="signposting-dropdown plts-criteria"><ul>';
    pltsddStr += '<li><p class="title">Personal Learning and Thinking Skils (PLTS) Signposting</p></li>';
    pltsddStr += '<li data-category="plst"><label><input type="checkbox" /> <span>Independent Enquirers</span></label></li>';
    pltsddStr += '<li data-category="plst"><label><input type="checkbox" /> <span>Creative Thinkers</span></label></li>';
    pltsddStr += '<li data-category="plst"><label><input type="checkbox" /> <span>Reflective Learners</span></label></li>';
    pltsddStr += '<li data-category="plst"><label><input type="checkbox" /> <span>Team Workers</span></label></li>';
    pltsddStr += '<li data-category="plst"><label><input type="checkbox" /> <span>Self Managers</span></label></li>';
    pltsddStr += '<li data-category="plst"><label><input type="checkbox" /> <span>Effective Participants</span></label></li>';
    pltsddStr += '</ul></div>';
    
    var scddStr = '<div class="signposting-dropdown subject-criteria"><ul>';
    scddStr += '<li><p class="title">GCSE Subject Criteria Signposting</p></li>';
    scddStr += '<li data-category="English"><label><input type="checkbox"/> <span>English</span></label></li>';
    scddStr += '<li data-category="Mathmatics"><label><input type="checkbox"/> <span>Mathmatics</span></label></li>';
    scddStr += '</ul></div>';

    //console.log(acddStr) ;

    $(document).ready(function(){

        var $asddContainers = $('.ass-criteria-row .signpost-container'),
            $pltsddContainers = $('.plts-criteria-row .signpost-container'),
            $scddContainers = $('.subject-criteria-row.signpost-container'),
            $signpostDropdown = $('.signposting-dropdown'),
            $signpostContainer = $('.signpost-container');

         if($asddContainers.length > 0){
            $asddContainers.append(acddStr);
         };

         if($pltsddContainers.length > 0){
            $pltsddContainers.append(pltsddStr);
         };

         if($scddContainers.length > 0){
            $scddContainers.append(scddStr);
         };

         var signPostsClose = function(){
            //console.log('signposts close');

            $('.signposting-dropdown').hide(500);
         };



    
         $('body').on("click", ".dropdownToggle", function(e){

            var $this = $(this),
                $dropdown;

            if($this.hasClass('acddToggle')){
                $dropdown = $this.parents('.panel-heading').siblings('.panel-collapse').find(".ass-criteria-row .signposting-dropdown");
            }
            else if($this.hasClass('pltsddToggle')){
                $dropdown = $this.parents('.panel-heading').siblings('.panel-collapse').find(".plts-criteria-row .signposting-dropdown");
            }
            else if($this.hasClass('scddToggle')){
                $dropdown = $this.siblings(".signposting-dropdown");
            }
            else{
                return;
            }

            if($dropdown.is(':visible')){
                //console.log('I can see you');
                signPostsClose();
            }
            else{
                signPostsClose();
                $dropdown.toggle(500);
            }

            e.stopPropagation();
                
         });

         $('body').on("click", function(e){

            // cloce signpost dropdown when clicked outside 
            if($(e.target).closest('.signposting-dropdown').length == 0){
                console.log('outside');
                signPostsClose();
                            }
            else {
                console.log('inside');
            }
            
            //e.stopPropagation();

         });/**/


    });
