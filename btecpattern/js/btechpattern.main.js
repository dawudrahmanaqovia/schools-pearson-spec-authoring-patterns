/*******************************************************************

			btechpattern.main.js

********************************************************************/
    "use strict"

    var acddStr = '<div class="signposting-dropdown acceptance-criteria"><ul>';
    acddStr += '<li><p class="title">Functional Skills Signposting</p></li>';
    acddStr += '<li data-criteria = "english"><p class="cat-title">English</p></li>';
    acddStr += '<li data-criteria = "english"><label><input type="checkbox" /> <span>Speaking, listening and communication</span></label></li>';
    acddStr += '<li data-criteria = "english"><label><input type="checkbox" /> <span>Reading</span></label></li>';
    acddStr += '<li data-criteria = "english"><label><input type="checkbox" /> <span>Writing</span></label></li>';
    acddStr += '<li data-criteria = "mathematics"><p class="cat-title">Mathematics</p></li>';
    acddStr += '<li data-criteria = "mathematics"><label><input type="checkbox" /> <span>Representing</span></label></li>';
    acddStr += '<li data-criteria = "mathematics"><label><input type="checkbox" /> <span>Analysing</span></label></li>';
    acddStr += '<li data-criteria = "mathematics"><label><input type="checkbox" /> <span>Interpreting</span></label></li>';
    acddStr += '<li data-criteria = "ict"><p class="cat-title">ICT</p></li>';
    acddStr += '<li data-criteria = "ict"><label><input type="checkbox"/> <span>Using ICT</span></label></li>';
    acddStr += '<li data-criteria = "ict"><label><input type="checkbox"/> <span>Finding and selecting information</span></label></li>';
    acddStr += '<li data-criteria = "ict"><label><input type="checkbox"/> <span>Developing, presenting and communicating information Using ICT</span></label></li>';
    acddStr += '</ul></div>';
    
    var pltsddStr = '<div class="signposting-dropdown plts-criteria"><ul>';
    pltsddStr += '<li><p class="title">Personal Learning and Thinking Skils (PLTS) Signposting</p></li>';
    pltsddStr += '<li data-criteria = "plst"><label><input type="checkbox" /> <span>Independent Enquirers</span></label></li>';
    pltsddStr += '<li data-criteria = "plst"><label><input type="checkbox" /> <span>Creative Thinkers</span></label></li>';
    pltsddStr += '<li data-criteria = "plst"><label><input type="checkbox" /> <span>Reflective Learners</span></label></li>';
    pltsddStr += '<li data-criteria = "plst"><label><input type="checkbox" /> <span>Team Workers</span></label></li>';
    pltsddStr += '<li data-criteria = "plst"><label><input type="checkbox" /> <span>Self Managers</span></label></li>';
    pltsddStr += '<li data-criteria = "plst"><label><input type="checkbox" /> <span>Effective Participants</span></label></li>';
    pltsddStr += '</ul></div>';
    
    var scddStr = '<div class="signposting-dropdown subject-criteria"><ul>';
    scddStr += '<li><p class="title">GCSE Subject Criteria Signposting</p></li>';
    scddStr += '<li><label><input data-criteria = "English" type="checkbox"/> <span>English</span></label></li>';
    scddStr += '<li><label><input data-criteria="Mathmatics" type="checkbox"/> <span>Mathmatics</span></label></li>';
    scddStr += '</ul></div>';

    $(document).ready(function(){

        var $asddContainers = $('.ass-criteria-row .signpost-container'),
            $pltsddContainers = $('.plts-criteria-row .signpost-container'),
            $scddContainers = $('.subject-criteria-row.signpost-container'),
            $signpostDropdown = $('.signposting-dropdown'),
            $signpostContainer = $('.signpost-container'),
            $criteriaContainer;

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

            $('.signposting-dropdown').hide(500);
         };

         var initDropdown = function($dropdown, $criteriaContainer){

            var $collection = $criteriaContainer.find('button'),
                $checkboxes = $dropdown.find("li label input[type='checkbox']");

                console.log('checkboxes', $checkboxes.length);

            if($collection.length > 0){
                console.log('the collection contains ',$collection.length ,' items.');

                var collectionItems = [];

                for (var i = 0; i < $collection.length;  i++) {

                    collectionItems[i] = $($collection[i]).text();

                    // loop through the checkboxes and if the data attribute is the same as this collection item set the checkbox 
                    for (var x = $checkboxes.length - 1; x >= 0; x--) {

                        var $criteria = $($checkboxes[x]).data('criteria');

                        if(collectionItems[i] === $criteria){
                            //console.log('true');
                            // set checkbox
                            $($checkboxes[x]).attr('checked','checked');
                        }
                    };
                };
                //console.log('collection = ',collectionItems);

                return;
            }
            else {
                console.log('collection is empty ',$collection.length );
            }

         };



    
         $('body').on("click", ".dropdownToggle", function(e){

            var $this = $(this),
                $dropdown;

            if($this.hasClass('acddToggle')){
                
                $dropdown = $this.parents('.panel-heading').siblings('.panel-collapse').find(".ass-criteria-row .signposting-dropdown");
                $criteriaContainer = $dropdown.parents('.ass-criteria-row');
            }
            else if($this.hasClass('pltsddToggle')){
                
                $dropdown = $this.parents('.panel-heading').siblings('.panel-collapse').find(".plts-criteria-row .signposting-dropdown");
                $criteriaContainer = $dropdown.parents('.plts-criteria-row');
            }
            else if($this.hasClass('scddToggle')){
                
                $dropdown = $this.siblings(".signposting-dropdown");
                $criteriaContainer = $criteriaContainer = $dropdown.parents('.categories');

                initDropdown($dropdown, $criteriaContainer);

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
                $dropdown.show(500);
            }

            e.stopPropagation();
                
         });

         $('body').on("click", function(e){

            // cloce signpost dropdown when clicked outside 
            if($(e.target).closest('.signposting-dropdown').length == 0){
                console.log('outside');
                signPostsClose();
            }

         });


    });
