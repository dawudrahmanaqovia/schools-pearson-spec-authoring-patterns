<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions">

<!-- Teacher Guidance data section -->
<xsl:template match="teacher_guidance">
	<xsl:param name="learningaims"/>


  <div class="panel panel-primary">
    <div class="panel-heading">
    <span class="panel-title">
    <i class="icon-collapse accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapse_teacher_guidance"/><xsl:text>   </xsl:text>
    Teacher Guidance
	</span>
      <i class="icon-question-sign pull-right" data-content="The unit introduction should give the reader a snapshot of the purpose of the unit and how it fits into the vocational setting of the qualification" data-original-title="Unit Introduction"/>
    </div>
    <div id="collapse_teacher_guidance" class="panel-collapse collapse in">
      <div class="panel-body">
     
			<xsl:apply-templates select="node()[not(self::additional_assessment_guidance)]"/>
			
			<xsl:if test="/unit/meta/assessment_type = 'Internal'">
				<xsl:apply-templates select="$learningaims" mode="assessment_guidance"/>					
			</xsl:if>
			    
			<xsl:if test="/unit/meta/assessment_type = 'Internal'">
				<xsl:apply-templates select="additional_assessment_guidance"/>
			</xsl:if>
      </div>
    </div>
  </div>
  
	</xsl:template>
	
	
	<!-- Resources -->
	<xsl:template match="resources">
	
		 <div class="panel panel-success">
		  <div class="panel-heading">Resources</div>
		  <div class="panel-body">
			<xsl:apply-templates select="node()"/>
		  </div>
		</div>	

	</xsl:template>
	
	<!-- Assessment guidance summary -->
	<xsl:template match="assessment_guidance_summary">
	
		 <div class="panel panel-success">
		  <div class="panel-heading">Assessment Guidance Summary</div>
		  <div class="panel-body">
			<xsl:apply-templates select="node()"/>
		  </div>
		</div>	

	</xsl:template>	
	
	
	
	
	
	<!-- Assessment guidance for Learning Aim -->
	<xsl:template match="assessment_guidance">
		<xsl:apply-templates select="node()"/>	
	</xsl:template>


	<xsl:template match="learning_objectives" mode="assessment_guidance">
	  <div class="panel panel-success">
		<div class="panel-heading">
		<span class="panel-title">
		<i class="icon-collapse accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapse_assessment_guidance"/>
			Assessment Guidance for Learning Aim(s)
		</span>
		<i class="icon-question-sign pull-right" data-toggle="popover" title="" data-content="Please include where applicable if evidence would need witness or observation records, videos etc to support the decision made." data-original-title="Assessment Guidance"/>
		</div>
		<div id="collapse_assessment_guidance" class="panel-collapse collapse in">
		  <div class="panel-body">
				<!--<div class="panel-group" id="accordion_assessment_critieria">--><!-- Switch off accordion -->
					<xsl:apply-templates select="learning_objective" mode="assessment_guidance"/>
				<!--</div>-->
		  </div>
		</div>  
	  </div>
	 
	</xsl:template>
	<!-- End Learning Aims data section -->
	
	
	
	<!-- Learning Aim data section -->
	<xsl:template match="learning_objective" mode="assessment_guidance">
	
	<div class="panel panel-info">
	  <div class="panel-heading">
	  <i class="icon-collapse accordion-toggle" data-toggle="collapse" data-parent="#accordion_assessment_guidance" href="#collapse_assessment_guidance{count(preceding::learning_objective)+1}"/><xsl:text>   </xsl:text>
	  Learning Aim <xsl:number count="learning_objective" from="/unit/learning_objectives" level="multiple" format="AA"/>: <xsl:apply-templates select="learning_objective_title"/></div>
			<div id="collapse_assessment_guidance{count(preceding::learning_objective)+1}" class="panel-collapse collapse in">
				<div class="panel-body">
					<xsl:apply-templates select="assessment_criterias" mode="assessment_guidance"/>
				</div>
			</div>		
	</div>
	<br/>
	</xsl:template>
	<!-- End Learning Aim data section -->

		
	<!-- Assessment Criteria data table -->
	<xsl:template match="assessment_criteria" mode="assessment_guidance">
					<xsl:apply-templates select="assessment_criteria" mode="assessment_guidance"/>
	</xsl:template>


	<!-- Assessment Criteria data -->
	<xsl:template match="assessment_criteria" mode="assessment_guidance">
	
		  <table class="table table-bordered">
				<tbody>
					<tr>
						<td  colspan="2"><xsl:apply-templates select="../../assessment_guidance/title" /></td>
					</tr>			
					<tr>
						<xsl:apply-templates select="level_1_criteria" mode="assessment_guidance"/>
					</tr>
					<tr>
						<xsl:apply-templates select="pass_criteria" mode="assessment_guidance"/>
					</tr>
					<tr>
						<xsl:apply-templates select="merit_criteria" mode="assessment_guidance"/>
					</tr>
					<tr>
						<xsl:apply-templates select="distinction_criteria" mode="assessment_guidance"/>
					</tr>
				</tbody>
		   </table>
		   
	</xsl:template>
	
	
	<!-- Assessment Criteria data section table cells -->
	<xsl:template match="level_1_criteria"  mode="assessment_guidance">
		<td width="25%" style="background-color:#d9edf7">
		<div align="center">Level 1 Pass</div>
			<xsl:call-template name="criterion_id">
				<xsl:with-param name="criteria_node" select="name()"/>
			</xsl:call-template>
			<xsl:apply-templates select="criterion"/>  
		</td>
		<td width="75%"><xsl:apply-templates select="criterion_guidance"/></td>
	</xsl:template>
	<xsl:template match="pass_criteria"  mode="assessment_guidance">
		<td width="25%" class="danger">
		<div align="center">Level 2 Pass</div>
			<xsl:call-template name="criterion_id">
				<xsl:with-param name="criteria_node" select="name()"/>
			</xsl:call-template>
			<xsl:apply-templates select="criterion"/>  
		</td>
		<td width="75%"><xsl:apply-templates select="criterion_guidance"/></td>
	</xsl:template>
	<xsl:template match="merit_criteria"  mode="assessment_guidance">
		<td width="25%" class="warning">
		<div align="center">Level 2 Merit</div>
			<xsl:call-template name="criterion_id">
				<xsl:with-param name="criteria_node" select="name()"/>
			</xsl:call-template>
			<xsl:apply-templates select="criterion"/>  
		</td>
		<td width="75%"><xsl:apply-templates select="criterion_guidance"/></td>
	</xsl:template>
	<xsl:template match="distinction_criteria"  mode="assessment_guidance">
		<td width="25%" class="success">
		<div align="center">Level 2 Distinction</div>
			<xsl:call-template name="criterion_id">
				<xsl:with-param name="criteria_node" select="name()"/>
			</xsl:call-template>
			<xsl:apply-templates select="criterion"/>  
		</td>
		<td width="75%"><xsl:apply-templates select="criterion_guidance"/></td>
	</xsl:template>
	
	
	<xsl:template match="criterion_guidance">
				<xsl:apply-templates select="node()"/>
	</xsl:template>
<!-- End Assessment guidance for Learning Aims -->



	
	
	
	
	<!-- Additional Assessment Guidance Information -->
	<xsl:template match="additional_assessment_guidance">
	
		 <div class="panel panel-success">
		  <div class="panel-heading">Additional Assessment Guidance Information</div>
		  <div class="panel-body">
			<xsl:apply-templates select="node()"/>
		  </div>
		</div>	

	</xsl:template>			
	
	
</xsl:stylesheet>
