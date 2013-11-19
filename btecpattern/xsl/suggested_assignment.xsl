<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions">

<!-- Suggested Assignment data section -->
<xsl:template match="suggested_assignment">

<xsl:apply-templates select="node()"/>

</xsl:template>



<xsl:template match="learning_objectives" mode="suggested_assignment">
  <div class="panel panel-primary">
    <div class="panel-heading">
    <span class="panel-title">
    <i class="icon-collapse accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapse_suggested_assignment"/>
		Suggested Assignment Outlines
	</span>
	<i class="icon-question-sign pull-right" data-toggle="popover" title="" data-content="Please include where applicable if evidence would need witness or observation records, videos etc to support the decision made." data-original-title="Assessment Guidance"/>
    </div>
    <div id="collapse_suggested_assignment" class="panel-collapse collapse in">
      <div class="panel-body">
      
      	<div class="panel panel-default">
		  <div class="panel-heading">Suggested Assignment Outlines Summary</div>
		  <div class="panel-body">
			<xsl:apply-templates select="../suggest_assignment_summary"/>
		  </div>
		</div>
   
   
        <div class="panel panel-default">
		  <div class="panel-heading">Suggested Assignment Outlines for Learning Aim(s)</div>
		  <div class="panel-body">

			<!--<div class="panel-group" id="accordion_suggested_assignment">--><!-- Switch off accordion -->
				<xsl:apply-templates select="learning_objective" mode="suggested_assignment"/>
			<!--</div>-->

		  </div>
		</div>
		
      </div>
    </div>
  </div>
 
</xsl:template>
<!-- End Learning Aims data section -->



<!-- Learning Aim data section -->
<xsl:template match="learning_objective" mode="suggested_assignment">

<div class="panel panel-info">
  <div class="panel-heading">
    <i class="icon-collapse accordion-toggle" data-toggle="collapse" data-parent="#accordion_suggested_assignment" href="#collapse_suggested_assignment{count(preceding::learning_objective)+1}"/><xsl:text>   </xsl:text>
  Learning Aim <xsl:number count="learning_objective" from="/unit/learning_objectives" level="multiple" format="AA"/>: <xsl:apply-templates select="learning_objective_title"/>
  </div>
    <div id="collapse_suggested_assignment{count(preceding::learning_objective)+1}" class="panel-collapse collapse in">
      <div class="panel-body">


				   	
			   		
					<xsl:apply-templates select="assessment_criteria" mode="suggested_assignment"/>	
					<xsl:apply-templates select="suggested_assignment"/>


      </div>
    </div>		
</div>
</xsl:template>
<!-- End Learning Aim data section -->












<!-- Suggested Assignment -->
<xsl:template match="suggested_assignment">
	<div class="row">
					<div class="col-xs-12">
						<label for="{local-name(.)}" class="control-label">Assignment Title: </label>
						<div class="form-control"><xsl:apply-templates select="assignment_title"/>
							<i class="icon-question-sign pull-right" data-toggle="popover" title="" data-content="The title should reflect the Suggested Assignment" data-original-title="Assignment Title"/>					
						</div>
					</div>			
	</div>
	<br/>
	<div class="row">
					<div class="col-xs-6">
						<div class="panel panel-info">
						  <div class="panel-heading">
							<span class="panel-title">Scenario </span>
						  </div>
						  <div class="panel-body">
							<xsl:apply-templates select="scenario"/>
						  </div>
						</div>					
					</div>	
					<div class="col-xs-6">
						<div class="panel panel-info">
						  <div class="panel-heading">
							<span class="panel-title">Assignment Evidence </span>
						  </div>
						  <div class="panel-body">
							<xsl:apply-templates select="assessment_evidence"/>
						  </div>
						</div>
					</div>
	</div>
</xsl:template>



<!-- Assessment Criteria data table -->
<xsl:template match="assessment_criteria" mode="suggested_assignment">
	<div class="row">
 	  <table class="table">
				<thead>
				</thead>
				<tbody>	
				   	 
				<tr>
					<td width="25%" valign="top" style="background-color:#d9edf7"><xsl:apply-templates select="level_1_criteria" mode="suggested_assignment"/></td>
					<td width="25%" valign="top" class="danger"><xsl:apply-templates select="pass_criteria" mode="suggested_assignment"/></td>
					<td width="25%" valign="top" class="warning"><xsl:apply-templates select="merit_criteria" mode="suggested_assignment"/></td>
					<td width="25%" valign="top" class="success"><xsl:apply-templates select="distinction_criteria" mode="suggested_assignment"/></td>
				</tr>
				</tbody>
	   </table>
	</div>
</xsl:template>



<!-- Assessment Criteria data section table cells -->
<xsl:template match="level_1_criteria"  mode="suggested_assignment">
	<div align="center">Level 1 Pass</div>
		<xsl:call-template name="criterion_id">
			<xsl:with-param name="criteria_node" select="name()"/>
		</xsl:call-template>
	<xsl:apply-templates select="criterion"/>
</xsl:template>
<xsl:template match="pass_criteria"  mode="suggested_assignment">
	<div align="center">Level 2 Pass</div>
		<xsl:call-template name="criterion_id">
			<xsl:with-param name="criteria_node" select="name()"/>
		</xsl:call-template>
	<xsl:apply-templates select="criterion"/>
</xsl:template>
<xsl:template match="merit_criteria"  mode="suggested_assignment">
	<div align="center">Level 2 Merit</div>
		<xsl:call-template name="criterion_id">
			<xsl:with-param name="criteria_node" select="name()"/>
		</xsl:call-template>
	<xsl:apply-templates select="criterion"/>
</xsl:template>
<xsl:template match="distinction_criteria"  mode="suggested_assignment">
	<div align="center">Level 2 Distinction</div>
		<xsl:call-template name="criterion_id">
			<xsl:with-param name="criteria_node" select="name()"/>
		</xsl:call-template>
	<xsl:apply-templates select="criterion"/>
</xsl:template>


</xsl:stylesheet>
