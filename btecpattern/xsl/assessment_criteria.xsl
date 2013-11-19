<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions">

<!-- Assessment Criteria data section -->
<xsl:template match="assessment_criterias">

<xsl:apply-templates select="node()"/>

</xsl:template>



<xsl:template match="learning_objectives" mode="assessment_criteria">
  <div class="panel panel-primary overflow">
    <div class="panel-heading">
    <span class="panel-title">
    <i class="icon-collapse accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapse_assessment_criteria"/>
		Assessment Criteria
	</span>
	<i class="icon-question-sign pull-right" data-toggle="popover" title="" data-content="Make sure these are criteria that you can measure against and not a task - if you can't measure it, it isn't a criterion" data-original-title="Assessment Criteria"/>
    </div>
    <div id="collapse_assessment_criteria" class="panel-collapse collapse in">
      <div class="panel-body overflow">
			<!--<div class="panel-group" id="accordion_assessment_critieria">--><!-- Switch off accordion -->
				<xsl:apply-templates select="learning_objective" mode="assessment_criteria"/>
			<!--</div>-->
      </div>
    </div>
  </div>
 
</xsl:template>
<!-- End Learning Aims data section -->



<!-- Learning Aim data section -->
<xsl:template match="learning_objective" mode="assessment_criteria">

			<xsl:apply-templates select="assessment_criterias"/>

</xsl:template>
<!-- End Learning Aim data section -->



<!-- Assessment Criteria data table -->
<xsl:template match="assessment_criterias">

<div class="panel panel-info overflow">
  <div class="panel-heading">
  	<i class="icon-collapse accordion-toggle" data-toggle="collapse" data-parent="#accordion_assessment_critieria" href="#collapse_assessment_criteria{count(preceding::learning_objective)+1}"/><xsl:text>   </xsl:text>
		Learning Aim <xsl:number count="learning_objective" from="/unit/learning_objectives" level="multiple" format="AA"/>: <xsl:apply-templates select="../learning_objective_title"/></div>
    <div id="collapse_assessment_criteria{count(preceding::learning_objective)+1}" class="panel-collapse collapse in">
      <div class="panel-body overflow">

	  <table class="table table-bordered">
			<thead>
				<tr>
					<th width="25%"><div class="alert alert-info">Level 1 Pass</div></th>
					<th width="25%"><div class="alert alert-danger">Level 2 Pass</div></th>
					<th width="25%"><div class="alert alert-warning">Level 2 Merit</div></th>
					<th width="25%"><div class="alert alert-success">Level 2 Distinction</div></th>
				</tr>
			</thead>
			<tbody>
						<xsl:apply-templates select="assessment_criteria"/>
			</tbody>
	   </table>
       </div>
    </div>
</div>
<br/>	   
</xsl:template>





<!-- Assessment Criteria row  -->
<xsl:template match="assessment_criteria">

				<tr>
					<td><xsl:apply-templates select="level_1_criteria"/></td>
					<td><xsl:apply-templates select="pass_criteria"/></td>
					<td><xsl:apply-templates select="merit_criteria"/></td>
					<td><xsl:apply-templates select="distinction_criteria"/></td>
				</tr>
	   
</xsl:template>


<!-- Assessment Criteria data section table cells -->
<xsl:template match="level_1_criteria | pass_criteria | merit_criteria | distinction_criteria">


<!--<div class="myDropdownCheckboxcat dropdown-checkbox dropdown pull-right">
--><!--		<button class="dropdown-checkbox-toggle btn btn-primary" data-toggle="dropdown" href="#">Dropdown Checkbox <span class="dropdown-checkbox-nbselected"></span></button>
-->		

<!--</div>		
--> 
	<xsl:call-template name="criterion_id">
		<xsl:with-param name="criteria_node" select="name()"/>
	</xsl:call-template>
	<xsl:apply-templates select="criterion"/>
	

	<xsl:apply-templates select="categories"/>


		<script type="text/javascript">
		var myData = [{id: 1, label: "Test" }];
			$(".myDropdownCheckbox").dropdownCheckbox({
			  data: myData,
			  title: "<i class="icon-plus-sign"/>"
		});
		
		
		var tab = [
		  { id: "1", label: "Forever.", isChecked: true },
		  { id: "2", label: "I love cheese.", isChecked: true },
		  { id: "3", label: "Meat for all", isChecked: false },
		  { id: "4", label: "Again and again", isChecked: true },
		  { id: "5", label: "Hey bro!", isChecked: true },
		  { id: "6", label: "It's working?", isChecked: false },
		  { id: "7", label: "Horse", isChecked: true },
		  { id: "8", label: "z-index", isChecked: true },
		  { id: "9", label: "language scala", isChecked: true },
		  { id: "10", label: "Yahoo", isChecked: true },
		  { id: "11", label: "yellow", isChecked: true },
		  { id: "12", label: "Gooooooooooogle", isChecked: true },
		  { id: "13", label: "NO WAY!", isChecked: false },
		  { id: "14", label: "2 times?", isChecked: true }
		];
		$('.myDropdownCheckboxcat').dropdownCheckbox({
		  data: tab,
		  autosearch: true,
		  btnClass: "btn btn-primary icon-plus-sign bringtofront",
		  hideHeader: false,
		  title: ""
		});		
		
		</script>
		
</xsl:template>


  <xsl:template match="categories">
    <div class="categories">      
      <div class="categoriesThemselves">
        <a href="#" class="category" onmousedown="showOptions(event, this, node);">
          <xsl:apply-templates/>
        </a>
      </div>
    </div>
    
    <div class="myDropdownCheckboxcat pull-right">
	<!--<button type="button" class="pull-right btn btn-primary" data-placement="auto" data-toggle="dropdown" title="Add"><i class="icon-plus-sign"/></button>-->
	</div>
  </xsl:template>

  <xsl:template match="category">
	  <span class="badge"><xsl:value-of select="string(.)"/></span>
    <xsl:if test="following-sibling::*[1]">,</xsl:if>    
  </xsl:template>




<!-- criterion_id function -->
<xsl:template name="criterion_id" match="/">
		<xsl:param name="criteria_node"/>
		
			<xsl:variable name="level">
			<xsl:choose>
				 <xsl:when test="$criteria_node = 'level_1_criteria'">1</xsl:when>
				 <xsl:when test="$criteria_node = 'pass_criteria'">2</xsl:when>
				 <xsl:when test="$criteria_node = 'merit_criteria'">2</xsl:when>
				 <xsl:when test="$criteria_node = 'distinction_criteria'">2</xsl:when>
			</xsl:choose>			
			</xsl:variable>
			
			<xsl:variable name="critieria_letter">
			<xsl:choose>
				 <xsl:when test="$criteria_node = 'level_1_criteria'"></xsl:when>
				 <xsl:when test="$criteria_node = 'pass_criteria'">P</xsl:when>
				 <xsl:when test="$criteria_node = 'merit_criteria'">M</xsl:when>
				 <xsl:when test="$criteria_node = 'distinction_criteria'">D</xsl:when>
			</xsl:choose>			
			</xsl:variable>

			<xsl:variable name="auto_critieria_id" >
				<xsl:value-of select="$level" /><xsl:number count="learning_objective" from="/unit/learning_objectives" level="multiple" format="A"/>
					<xsl:text>.</xsl:text><xsl:value-of select="$critieria_letter"/><xsl:number count="assessment_criteria" level="any" format="1"/>
			</xsl:variable>

			<span class="badge"><xsl:value-of select="$auto_critieria_id"/></span>

</xsl:template>


<!-- criterion data section -->
<xsl:template match="criterion">
			<xsl:apply-templates select="node()"/>
</xsl:template>


</xsl:stylesheet>
