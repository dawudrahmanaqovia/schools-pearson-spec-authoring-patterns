<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions">

	<!-- Unit section -->
	<xsl:template match="unit">	
	
	<div class="panel-group" id="accordion">
		<div class="panel panel-default">
		
		<xsl:apply-templates select="meta" mode="page_title"/>
			
		  <div class="panel-body">	  
					
					<!-- Meta -->
					<xsl:apply-templates select="meta"/>
					<!-- Introduction -->
					<xsl:apply-templates select="introduction"/>
					<!-- Learning Aims -->
					<xsl:apply-templates select="learning_objectives" mode="learningaims"/>
					<!-- Content -->
					<xsl:if test="learning_objectives/learning_objective/learning_objective_content">
						<xsl:apply-templates select="learning_objectives" mode="content"/>
					</xsl:if>
					<xsl:if test="meta/assessment_type = 'Internal'">
					
						<xsl:if test="learning_objectives/learning_objective/assessment_criterias">
							<xsl:apply-templates select="learning_objectives" mode="assessment_criteria"/>
						</xsl:if>	
						<xsl:if test="suggest_assignment">
							<xsl:apply-templates select="learning_objectives" mode="suggested_assignment"/>
						</xsl:if>
					</xsl:if>
					
										
					<xsl:apply-templates select="teacher_guidance">
						<xsl:with-param name="learningaims" select="learning_objectives"/>
					</xsl:apply-templates>
					

		  </div>
		</div>
	</div>
	
	</xsl:template>
	<!-- End Unit section -->

	<xsl:template match="meta" mode="page_title">		
		<div class="panel-heading">
			<h1>Unit <xsl:value-of select="number"/> : <xsl:value-of select="unit_title"/></h1>
		</div>
	</xsl:template>

	
	<!-- PAGE RENDERING -->
	<!-- Page section Not used currently!! -->
		<!-- Prepend each section title with an autoincrementing number. -->
	<xsl:template name="page_section">
		<xsl:param name="var_section"/>


  <div class="panel panel-primary">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">
				<xsl:apply-templates select="/unit/title"/>
        </a>
      </h4>
    </div>
    <div id="collapseTwo" class="panel-collapse collapse">
      <div class="panel-body">
      
		<xsl:apply-templates select="introduction"/>

      </div>
    </div>
  </div>		

	</xsl:template>

</xsl:stylesheet>